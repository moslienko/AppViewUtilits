//
//  AppLabel.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 19.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public class AppLabel: UILabel {

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Init
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience public init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    convenience public init(attributedText: NSMutableAttributedString) {
        self.init(frame: .zero)
        self.attributedText = attributedText
    }
}
