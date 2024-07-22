//
//  PlaceholderView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

/// A view that displays a placeholder
final public class PlaceholderView: AppView {
    
    // MARK: - Params
    
    /// Placeholder type
    public var type: PlaceholderType = DefaultPlaceholderType.empty {
        didSet {
            setupView(type: type)
        }
    }
    
    /// Configurable options
    public var options: PlaceholderOptions = PlaceholderOptions() {
        didSet {
            setupView(type: type)
        }
    }
    
    // MARK: - Callbacks
    public var didActionButtonTapped: Callback?
    
    // MARK: - Components
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private(set) lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private(set) lazy var messageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private(set) lazy var stackView: AppStackView = AppStackView(
        [iconImageView, titleLabel, messageLabel],
        axis: .vertical,
        spacing: 16
    )
    
    private(set) lazy var reloadButton: AppButton = {
        let button = AppButton(title: "")
        button.addAction {
            self.didActionButtonTapped?()
        }
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }
    
    // MARK: - Init
    
    /// Initializes a new `PlaceholderView` instance.
    /// - Parameters:
    ///   - type: The type of the placeholder.
    ///   - options: The options for customizing the placeholder view.
    ///   - didActionButtonTapped: Callback for when the action button is tapped.
    public init(
        type: PlaceholderType,
        options: PlaceholderOptions = PlaceholderOptions(),
        didActionButtonTapped: Callback? = nil
    ) {
        self.type = type
        self.options = options
        self.didActionButtonTapped = didActionButtonTapped
        super.init(frame: .zero)
        setupComponents()
        decorate()
        setupView(type: type)
    }
    
    // MARK: - Setup
    public override func setupComponents() {
        super.setupComponents()
        backgroundColor = self.options.containerOptions.backgroundColor
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(reloadButton)
        
        var stackOffset: CGFloat {
            switch options.containerOptions.buttonLayout {
            case .center:
                return options.buttonOptions.height + options.containerOptions.buttonTopSpacing
            case .bottom:
                return 0.0
            }
        }
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: self.options.containerOptions.insets.left),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: self.options.containerOptions.insets.right * -1),
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: self.options.containerOptions.insets.top),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: self.options.containerOptions.insets.bottom),
            
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -stackOffset),
            
            iconImageView.heightAnchor.constraint(equalToConstant: self.options.iconOptions.height),
            
            reloadButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: self.options.buttonOptions.leftOffset),
            reloadButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: self.options.buttonOptions.rightOffset * -1),
            reloadButton.heightAnchor.constraint(equalToConstant: self.options.buttonOptions.height),
        ])
        
        switch options.containerOptions.buttonLayout {
        case .center:
            NSLayoutConstraint.activate([
                reloadButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: self.options.containerOptions.buttonTopSpacing),
            ])
        case .bottom:
            NSLayoutConstraint.activate([
                reloadButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: self.options.buttonOptions.bottomOffset),
            ])
        }
    }
}

// MARK: - Public methods
public extension PlaceholderView {
    
    /// Configures the view with the provided placeholder type.
    func setupView(type: PlaceholderType) {
        iconImageView.image = type.icon
        titleLabel.text = type.title
        messageLabel.text = type.message
        
        reloadButton.setTitle(type.buttonTitle, for: [])
        reloadButton.isHidden = type.buttonTitle == nil
        
        iconImageView.tintColor = options.iconOptions.tintColor
        iconImageView.contentMode =  options.iconOptions.contentMode
        
        stackView.spacing = options.containerOptions.textsSpacing
    }
    
    // Applies styles to the title label, message label, and button.
    /// - Parameters:
    ///   - titleLabelStyle: The style for the title label.
    ///   - messageLabelStyle: The style for the message label.
    ///   - buttonRegularStyle: The regular style for the button.
    ///   - buttonDisabledStyle: The disabled style for the button.
    ///   - highlightedStyle: The highlighted style for the button.
    func decorate(
        titleLabelStyle: DecorateWrapper<UILabel> = .defaultPlaceholderHeaderStyle(),
        messageLabelStyle: DecorateWrapper<UILabel> = .defaultPlaceholderMessageStyle(),
        buttonRegularStyle: DecorateWrapper<AppButton> = .defaultPlaceholderButtonStyle(),
        buttonDisabledStyle: DecorateWrapper<AppButton>? = nil,
        highlightedStyle: DecorateWrapper<AppButton>? = nil
    ) {
        self.titleLabel.apply(titleLabelStyle)
        self.messageLabel.apply(messageLabelStyle)
        self.reloadButton.regularStyle = buttonRegularStyle
        self.reloadButton.disabledStyle = buttonDisabledStyle
        self.reloadButton.highlightedStyle = highlightedStyle
    }
}
