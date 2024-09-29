<p align="center">
   <img width="200" src="https://moslienko.github.io/Assets/AppViewUtilits/sdk.png" alt="AppViewUtilits Logo">
</p>
<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

# AppViewUtilits

<p align="left">
A collection of useful extensions and classes for working on a iOS app projects that have been used in them many times.
</p>

## Table of Contents

* [Installation](#installation)
* [Extensions](#extensions)
* [Components](#components)
    * [AppView](#appview)
    * [AppAlert](#appalert)
    * [Placeholder](#placeholder)
    * [Cells](#cells)
        * [Table Cell](#table-cell)
        * [Collection Cell](#collection-cell)
	  * [Enhanced UIKit elements](#enhanced-uikit-elements)
        * [AppContentSizedTableView](#appcontentsizedtableview)
        * [AppButton](#appbutton)
        * [AppLabel](#applabel)
        * [AppTextField](#apprextfield)
        * [AppTextView](#apptextview)
        * [AppSpacerView](#appspacerview)
        * [AppLoaderView](#apploaderview)
        * [AppTouchLabel](#apptouchlabel)
        * [AppScrollView](#appscrollview)
        * [AppStackView](#appstackview)
        * [AppBarButtonItem](#appbarbuttonitem)
* [Helpers](#helpers)
    * [Debug](#debug)
        * [Log](#log)
        * [Measure](#measure)
        * [TimeLogger](#timelogger)
    * [Threads](#)
        * [DebouncedFunction](#debouncedfunction)
        * [RecursionFunction](#recursionfunction)
        * [ThreadSwitching](#threadswitching)
    * [AppVersion](#appversion)
    * [Decorate](#decorate)
    * [Environment](#environment)
    * [Reachability](#reachability)
    * [Callback](#callback)
    * [NotificationObserver](#notificationobserver)
    * [AppThemeManager](#appthememanager)
    * [AppLayout](#applayout)
    * [EventObject](#eventobject)
* [License](#license)

### Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/moslienko/AppViewUtilits.git", from: "1.3.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `AppViewUtilits`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate AppViewUtilits into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Extensions
There are extensions to the types: 

|                                                       |                                                  |                                                   |                                                   |
|------------------------------------------------------------|----------------------------------------------------------|-----------------------------------------------------------|----------------------------------------------------------|
| [Array](Sources/AppViewUtilits/Extensions/Extension+Array.swift) | [AVPlayer](Sources/AppViewUtilits/Extensions/Extension+AVPlayer.swift) | [UIButton](Sources/AppViewUtilits/Extensions/Extension+UIButton.swift) | [CALayer](Sources/AppViewUtilits/Extensions/Extension+CALayer.swift) |
| [CAAnimation](Sources/AppViewUtilits/Extensions/Extension+CAAnimation.swift) | [CGFloat](Sources/AppViewUtilits/Extensions/Extension+CGFloat.swift) | [Collection](Sources/AppViewUtilits/Extensions/Extension+Collection.swift) | [Color](Sources/AppViewUtilits/Extensions/Extension+Color.swift) |
| [Date](Sources/AppViewUtilits/Extensions/Extension+Date.swift) | [Dictionary](Sources/AppViewUtilits/Extensions/Extension+Dictionary.swift) | [Double](Sources/AppViewUtilits/Extensions/Extension+Double.swift) | [Encodable](Sources/AppViewUtilits/Extensions/Extension+Encodable.swift) |
| [FileManager](Sources/AppViewUtilits/Extensions/Extension+FileManager.swift) | [UIImage](Sources/AppViewUtilits/Extensions/Extension+UIImage.swift) | [UIImageView](Sources/AppViewUtilits/Extensions/Extension+UIImageView.swift) | [Int](Sources/AppViewUtilits/Extensions/Extension+Int.swift) |
| [Label](Sources/AppViewUtilits/Extensions/Extension+UILabel.swift) | [NSAttributedString](Sources/AppViewUtilits/Extensions/Extension+NSAttributedString.swift) | [NSCountedSet](Sources/AppViewUtilits/Extensions/Extension+NSCountedSet.swift) | [NSPredicate](Sources/AppViewUtilits/Extensions/Extension+NSPredicate.swift) |
| [Notification](Sources/AppViewUtilits/Extensions/Extension+Notification.swift) | [Optional](Sources/AppViewUtilits/Extensions/Extension+Optional.swift) | [Sequence](Sources/AppViewUtilits/Extensions/Extension+Sequence.swift) | [SKProduct](Sources/AppViewUtilits/Extensions/Extension+SKProduct.swift) |
| [String](Sources/AppViewUtilits/Extensions/Extension+String.swift) | [UICollectionView](Sources/AppViewUtilits/Extensions/Extension+UICollectionView.swift) | [UIColor](Sources/AppViewUtilits/Extensions/Extension+UIColor.swift) | [UIApplication](Sources/AppViewUtilits/Extensions/Extension+UIApplication.swift) |
| [UIBezierPath](Sources/AppViewUtilits/Extensions/Extension+UIBezierPath.swift) | [UILabel](Sources/AppViewUtilits/Extensions/Extension+UILabel.swift) | [UITableView](Sources/AppViewUtilits/Extensions/Extension+UITableView.swift) | [UITextField](Sources/AppViewUtilits/Extensions/Extension+UITextField.swift) |
| [UITabBar](Sources/AppViewUtilits/Extensions/Extension+UITabBar.swift) | [UIView](Sources/AppViewUtilits/Extensions/Extension+UIView.swift) | [UIViewController](Sources/AppViewUtilits/Extensions/Extension+UIViewController.swift) | [UIStackView](Sources/AppViewUtilits/Extensions/Extension+UIStackView.swift) |
| [UIWindow](Sources/AppViewUtilits/Extensions/Extension+UIWindow.swift) | [UIScrollView](Sources/AppViewUtilits/Extensions/Extension+UIScrollView.swift) | [View](Sources/AppViewUtilits/Extensions/Extension+View.swift) |  |

## Components

### AppView
AppView - this is a set of classes to facilitate work with a UIView & UIViewController. The following classes are available for use:
- `AppView` (UIView)
- `AppViewModel` - model class for AppView
- `AppViewController` (UIViewController).

`AppView` also supports handling of taps and swipes:

```swift
func addTap(_ action: @escaping DataCallback<CGPoint>)
func addDoubleTap(_ action: @escaping DataCallback<CGPoint>)
func addLongPress(minimumPressDuration: TimeInterval = 0, action: @escaping DataCallback<UILongPressGestureRecognizer>)
func addPan(_ panAction: @escaping DataCallback<UIPanGestureRecognizer>)
func addSwipeGestureRecognizer(directions: UISwipeGestureRecognizer.Direction, action: @escaping DataCallback<UISwipeGestureRecognizer.Direction>)
```

### AppAlert

`AppAlertController` - custom `UIAlertController` subclass for presenting alerts.

```swift
struct AppAlertViewModel {
  let title: String?
  let message: String?
  let actions: [AlertAction]?
  let preferredStyle: UIAlertController.Style
  var configureTextField: ((UITextField) -> Void)?
  var tintColor: UIColor
  var preventMultipleAlerts: Bool
}
```

Presents alert:

```swift
static func presentAlert(using model: AppAlertViewModel)
```

Or initialize the creation `AppAlertController`: to show the alert on the screen in your custom method:

```swift
static func createAppAlertController(with model: AppAlertViewModel) -> AppAlertController
```

### Placeholder

Displaying the customizable placeholder. Initializes a new `PlaceholderView`:

```swift
init(
    type: PlaceholderType,
    options: PlaceholderOptions = PlaceholderOptions(),
    didActionButtonTapped: Callback? = nil
)
```

Set the style for the placeholder UI elements:

```swift
func decorate(
  titleLabelStyle: DecorateWrapper<UILabel> = .defaultPlaceholderHeaderStyle(),
  messageLabelStyle: DecorateWrapper<UILabel> = .defaultPlaceholderMessageStyle(),
  buttonRegularStyle: DecorateWrapper<AppButton> = .defaultPlaceholderButtonStyle(),
  buttonDisabledStyle: DecorateWrapper<AppButton>? = nil,
  highlightedStyle: DecorateWrapper<AppButton>? = nil
)
```

Display the placeholder on the screen:

```swift
func addPlaceholder(_ view: PlaceholderView)
```

Remove the placeholder from the screen:

```swift
func removePlaceholder()
```

<details>
  <summary>Example of use:</summary>

```swift
enum AppPlaceholder: PlaceholderType {
  case emptyList

  var title: String {
    switch self {
    case .emptyList:
      return "Empty list"
    }
  }

  var message: String? {
    switch self {
    case .emptyList:
      return "You don't have any entries yet"
    }
  }

  var buttonTitle: String? {
    switch self {
    case .emptyList:
      return "Close"
    }
  }

  var icon: UIImage? {
    switch self {
    case .emptyList:
      return UIImage(systemName: "list.clipboard")
    }
  }
}

private(set) lazy var placeholderView: PlaceholderView = {
  let view = PlaceholderView(
    type: AppPlaceholder.emptyList,
    options: PlaceholderOptions(),
    didActionButtonTapped: { [weak self] in
    }
  )
  view.decorate(
    buttonRegularStyle: .wrap(style: { button in
      button.backgroundColor = .systemGreen
      button.tintColor = .white
      button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
      button.layer.cornerRadius = 15
    }),
    highlightedStyle: .wrap(style: { button in
      button.backgroundColor = .systemGreen.withAlphaComponent(0.7)
    })
  )
  return view
}()

...

if !self.models.isEmpty {
  self.tableView.removePlaceholder()
  self.tableView.reloadData()
} else {
  self.tableView.reloadData()
  self.tableView.addPlaceholder(self.placeholderView)
}
```

</details>

### Cells
#### Table Cell
 `AppViewTableCell` - class for table cell.

 ```swift
class ExampleCell: AppViewTableCell<ExampleCellModel> {

  override func updateView() {
    guard let cellModel = cellModel else {
      return
    }

    self.textLabel?.text = cellModel.title
    self.layoutIfNeeded()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }
}
```

```swift
class ExampleCellModel: AppViewCellIdentifiable {

  let title: String

  init(title: String) {
    self.title = title
  }
}
```

Register cell:

```swift
self.tableView.registerCellClass(ExampleCell.self)
```

Display cell:

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  guard let model = models[safe: indexPath.section]?[safe: indexPath.row] else {
    return UITableViewCell()
  }
  let cell = tableView.dequeueReusableCell(with: ExampleCell.self, for: indexPath)
  cell.cellModel = model as? ExampleCellModel

  return cell
}
```

#### Collection Cell

`AppViewCollectionCell` - class for collection cell.

### Enhanced UIKit elements
#### AppContentSizedTableView

A `UITableView` subclass that automatically adjusts its intrinsic content size based on its content size.

```swift
AppContentSizedTableView: UITableView {}
```

#### AppButton
 `UIButton` based class with useful extras.
 Can be used in conjunction with `DecorateWrapper` to automatic set different styles for all button states.

```swift
var regularStyle: DecorateWrapper<AppButton>?
var disabledStyle: DecorateWrapper<AppButton>?
var highlightedStyle: DecorateWrapper<AppButton>?
```

Handling actions.

```swift
let button = AppButton(title: "Action")
button.addAction {}
button.addTapAnimation(didHighlight: {}, didUnhighlight: {})
```

#### AppLabel

Subclass `UILabel`. 

```swift
init(text: String)
```

#### AppTextField
Subclass `UITextField`.

```swift
var textInsets: UIEdgeInsets
var maxCharacters: Int?

var didTextChanged: DataCallback<String>?
var didBeginEditing: DataCallback<UITextField>?
var didEndEditing: DataCallback<UITextField>?
var shouldBeginEditing: ReturnedDataCallback<UITextField, Bool>?
var shouldEndEditing: ReturnedDataCallback<UITextField, Bool>?
var shouldClear: ReturnedDataCallback<UITextField, Bool>?
var shouldReturn: ReturnedDataCallback<UITextField, Bool>?
var shouldChangeCharactersIn: ReturnedDataCallback<(UITextField, NSRange, String), Bool>?
```

#### AppTextView
Subclass `UITextView`. Callbacks similar to `AppTextField` are used, setting the `maxCharacters` value, placeholder setting.

```swift
var placeholder: String?
var placeholderColor: UIColor
var placeholderFont: UIFont
var placeholderFrame: CGRect?
```

#### AppSpacerView
Helpful `UIView` subclass for displaying a spacer component, e.g. as an additional element in a `UIStackView`.

```swift
enum Direction {
  case vertical(CGFloat)
  case horizontal(CGFloat)
}

init(_ direction: Direction? = nil)
static func createView(_ direction: AppSpacerView.Direction, color: UIColor) -> AppSpacerView
static func createView(_ direction: AppSpacerView.Direction, color: UIColor, width: Double)
```

#### AppLoaderView
 `UIVIew` subclass for displaying the indicator.
 
```swift
func configureActivityView(
  style: UIActivityIndicatorView.Style,
  color: UIColor, backgroundColor: UIColor
)
func beginLoading()
func finishLoading()
```

#### AppTouchLabel
`UILabel` subclass with the ability to tap on it.

```swift
init(action: @escaping Callback)
```

#### AppScrollView
Subclass `UIScrollView`.

```swift
func scrollToTop(animated: Bool)
func scrollToBottom(animated: Bool)
func scrollToLeft(animated: Bool)
func scrollToRight(animated: Bool)
func setScrollIndicatorsVisibility(vertical: Bool, horizontal: Bool)
```

#### AppStackView
Subclass `UIStackView`.

```swift
init(
  _ subviews: [UIView],
  axis: NSLayoutConstraint.Axis,
  spacing: CGFloat = 0,
  distribution: Distribution = .fill
)
```

#### AppBarButtonItem
Subclass `UIBarButtonItem`.

```swift
init(
  title: String,
  style: UIBarButtonItem.Style,
  action: Callback?
)

init(
  icon: UIImage?,
  style: UIBarButtonItem.Style,
  action: Callback?
)
```

## Helpers

### Debug

#### Log
Logger to the console.

```swift
Log.debug("Started")
Log.info("Success finished")
Log.error("Failed \(error)")
```

#### Measure
A utility class for measuring execution time and memory usage of code blocks.

Measures the execution time of a synchronous block of code.
 
```swift
func measureExecutionTime(
    label: String = "Execution Time",
    _ block: () -> Void
)
```

Measures the execution time of an asynchronous block of code.

```swift
func measureAsyncExecutionTime(
    label: String = "Async Operation",
    _ block: (@escaping () -> Void) -> Void
)
```

Measures the average execution time of a block of code over multiple runs.

```swift
func measureAverageExecutionTime(
    repeatCount: Int,
    label: String = "Average Execution Time",
    _ block: () -> Void
)
```

Measures the memory usage of a block of code.

```swift
func measureMemoryUsage(
    label: String = "Memory Usage",
    _ block: () -> Void
)
```

#### TimeLogger
A utility class for logging the time taken by various sections of code.

Starts timing a section of code.

```swift
func startSection(_ section: String)
```

Ends timing a section of code and logs the elapsed time.

```swift
func endSection(_ section: String)
```

### Threads

#### DebouncedFunction

Provide debouncing functionality.

```swift
let method = DebouncedFunction(delay: 1.0) {
    Log.debug("Called")
}
method.call()
```

#### RecursionFunction

Performs a recursive operation with a condition check and retry mechanism.
Example:

```swift
RecursionFunction(maxRetryCount: 5)
  .performRecursion(
    isCondition: {
      Int.random(in: 0...5) == 3
    },
    didHandleMethod: {
		   Log.debug("Recursion success handler")
    },
    delay: 3.0
  )
```

#### ThreadSwitching

Easy work with threads.

```swift
onMainThread {}
onBgThread {}
```

### AppVersion
Application version information.

```swift
AppVersion.getInfo()
```

Result:

```swift
struct Info {
  var appName: String
  var version: String
  var build: String
  var target: String
}
```

### Decorate

Wrapper for setting UI element styles.

```swift
extension DecorateWrapper where Element: UILabel {
    static func headerStyle() -> DecorateWrapper {
        return .wrap { label in
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 26.0)
            label.textAlignment = .left
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 2
        }
    }
}
```

Example call:

```swift
titleLabel.apply(.headerStyle())
```

### Environment

```swift
Environment.current
```

Result:

```swift
enum Environment {
  case debug
  case release
  case testFlight
}
```

### Reachability

Internet connection checker.

```swift
Reachability.isConnectedToNetwork()
```

### Callback

```swift
typealias Callback = () -> Void
typealias DataCallback<T> = (T) -> Void
typealias ValueCallback<T> = () -> T
typealias ReturnedDataCallback<A, B> = (A) -> B
```

### NotificationObserver

Helper class for working with NSNotification.

```swift
func addObserver(
  forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue? = .main,
  using block: @escaping (Notification) -> Void)
func removeObserver(_ observer: AnyObject)
func removeAllObservers()
```

### AppThemeManager

A manager for dynamically changing the apps appearance by overriding the user interface style on all screens.
Example:

```swift
var isDarkTheme = false {
  didSet {
    AppThemeManager.default.setAppTheme()
  }
}

...

AppThemeManager.default.setOverrideUserInterfaceStyleCallback = {
  self.isDarkTheme ? .dark : .light
}
```

### AppLayout
[![stability-experimental](https://img.shields.io/badge/stability-experimental-orange.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#experimental)

Building an interface through code. 

Example:

```swift
let listItemView = UIView()

listItemView.layout
  .addToSuperview(self.view)
  .height(64.0)
  .top(to: self.view.safeAreaLayoutGuide.topAnchor)
  .leading(to: self.view.leadingAnchor)
  .trailing(to: self.view.trailingAnchor)
```

### EventObject
 Class for sending and receiving events via Combine.
 
 ```swift
 public protocol EventReceiver {
  associatedtype Event

  func subscribe(receiveValue: @escaping (Event) -> Void) -> AnyCancellable
  func subscribe<S: Scheduler>(
    on scheduler: S,
    receiveValue: @escaping (Event) -> Void
  ) -> AnyCancellable
}

public protocol EventNotifier {
  associatedtype Event

  func send(_ event: Event)
  var receiver: any EventReceiver { get }
}

public class EventObject<Event>: EventNotifier, EventReceiver {}

 ```

## License

```
AppViewUtilits
Copyright (c) 2020 Pavel Moslienko moslienko@icloud.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

