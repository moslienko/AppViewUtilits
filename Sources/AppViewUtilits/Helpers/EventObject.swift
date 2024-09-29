//
//  EventObject.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 01.09.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Combine
import Foundation

/// Protocol for subscribers who can receive events.
@available(macOS 10.15, *)
@available(iOS 13.0, *)
public protocol EventReceiver {
    associatedtype Event
    
    /// Subscribes to receive event values.
    /// - Parameter receiveValue: Closure that is called when an event is received.
    /// - Returns: Subscribes to AnyCancellable.
    func subscribe(receiveValue: @escaping (Event) -> Void) -> AnyCancellable
    
    /// Subscribes to receive event values using the specified scheduler.
    /// - Parameters:
    /// - scheduler: The scheduler on which the closure will be executed.
    /// - receiveValue: The closure that is called when an event is received.
    /// - Returns: Subscription AnyCancellable.
    func subscribe<S: Scheduler>(
        on scheduler: S,
        receiveValue: @escaping (Event) -> Void
    ) -> AnyCancellable
}

/// Protocol for senders that can send events.
@available(macOS 10.15, *)
@available(iOS 13.0, *)
public protocol EventNotifier {
    associatedtype Event
    
    /// Sends an event to subscribers.
    /// - Parameter event: Event to send.
    func send(_ event: Event)
    
    /// Event receiver
    var receiver: any EventReceiver { get }
}

/// Class for sending and receiving events.
@available(macOS 10.15, *)
@available(iOS 13.0, *)
public class EventObject<Event>: EventNotifier, EventReceiver {
    
    // Property used to send events.
    private let subject: PassthroughSubject<Event, Never>
    
    // Init
    public init() {
        self.subject = PassthroughSubject<Event, Never>()
    }
    
    /// Receiver of events (the object itself).
    public var receiver: any EventReceiver { self }
    
    /// Sends the event to all subscribers.
    public func send(_ event: Event) {
        subject.send(event)
    }
    
    /// Subscribes to receive event values.
    public func subscribe(receiveValue: @escaping (Event) -> Void) -> AnyCancellable {
        subject.sink(receiveValue: receiveValue)
    }
    
    /// Subscribes to receive event values using the specified scheduler.
    public func subscribe<S: Scheduler>(
        on scheduler: S,
        receiveValue: @escaping (Event) -> Void
    ) -> AnyCancellable {
        subject
            .receive(on: scheduler)
            .sink(receiveValue: receiveValue)
    }
}
