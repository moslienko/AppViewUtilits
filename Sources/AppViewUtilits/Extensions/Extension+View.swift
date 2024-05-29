//
//  Extension+View.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 29.05.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Combine
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    
    func navigatePush(whenTrue toggle: Binding<Bool>) -> some View {
        NavigationLink(
            destination: self,
            isActive: toggle
        ) { EmptyView() }
    }
    
    func navigatePush<H: Hashable>(when binding: Binding<H>,
                                   matches: H) -> some View {
        NavigationLink(
            destination: self,
            tag: matches,
            selection: Binding<H?>(binding)
        ) { EmptyView() }
    }
    
    func navigatePush<H: Hashable>(when binding: Binding<H?>,
                                   matches: H) -> some View {
        NavigationLink(
            destination: self,
            tag: matches,
            selection: binding
        ) { EmptyView() }
    }
    
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
    
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
    
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .Merge(
                NotificationCenter
                    .default
                    .publisher(for: UIResponder.keyboardWillShowNotification)
                    .map { _ in true },
                NotificationCenter
                    .default
                    .publisher(for: UIResponder.keyboardWillHideNotification)
                    .map { _ in false })
            .debounce(for: .seconds(0.1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

@available(iOS 13.0, *)
public struct ViewDidLoadModifier: ViewModifier {
    
    @State private var viewDidLoad = false
    public let action: (() -> Void)?
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
