<p align="center">
   <img width="200" src="https://raw.githubusercontent.com/SvenTiigi/SwiftKit/gh-pages/readMeAssets/SwiftKitLogo.png" alt="AppViewUtilits Logo">
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

## Extensions
<p align="left">
There are extensions to the types: Double, UIViewController, UIImage, CAAnimation, UIBezierPath, UITabBar, Dictionary, Array, UITextField, CGFloat, Sequence, String, UILabel, Notification, FileManager, Int, CALayer, UIApplication, UIWindow, AVPlayer, NSCountedSet, Collection, UIView, Date, UIStackView, UITableView, Encodable, UICollectionView, UIColor, UIImageView, UIScrollView, Optional, UIButton, SKProduct.
</p>

## AppView
<p align="left">
AppView - this is a set of classes to facilitate work with a UIView & UIViewController. The following classes are available for use: AppView (UIView), AppViewModel - model class for AppView, AppViewController (UIViewController).
</p>

<p align="left">
AppView also supports handling of taps and swipes.
</p>

```swift
    func addTap(_ action: @escaping DataCallback<CGPoint>)
    func addDoubleTap(_ action: @escaping DataCallback<CGPoint>)
    func addLongPress(minimumPressDuration: TimeInterval = 0, action: @escaping DataCallback<UILongPressGestureRecognizer>)
    func addPan(_ panAction: @escaping DataCallback<UIPanGestureRecognizer>)
    func addSwipeGestureRecognizer(directions: UISwipeGestureRecognizer.Direction, action: @escaping DataCallback<UISwipeGestureRecognizer.Direction>)
```

## Cells
### Table Cell
<p align="left">
 AppViewTableCell - class for table cell.
</p>

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
<p align="left">
 Register cell:
</p>

```swift
    self.tableView.registerCellClass(ExampleCell.self)
```

<p align="left">
 Display cell:
</p>

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

### Collection Cell
<p align="left">
  AppViewCollectionCell - class for collection cell.
</p>

## Helpers

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

### LimitedTextField
UITextField with the maximum number of entered characters.
```swift
    LimitedTextField: UITextField {}
```

### ContentSizedTableView
```swift
    ContentSizedTableView: UITableView {}
```

### DebouncedFunction
```swift
let method = DebouncedFunction(delay: 1.0) {
    Log.debug("Called")
}
method.call()
```

### Reachability
Internet connection checker.
```swift
    Reachability.isConnectedToNetwork()
```

### ThreadSwitching
Easy work with threads.
```swift
    onMainThread {}
    onBgThread {}
```

### Log
Logger to the console.
```swift
    Log.debug("Started")
    Log.info("Success finished")
    Log.error("Failed \(error)")
```

### LimitedTextField
UITextField with the maximum number of entered characters.
```swift
    LimitedTextField: UITextField {}
```

### NotificationObserver
Helper class for working with NSNotification.
```swift
    func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue? = .main, using block: @escaping (Notification) -> Void)
    func removeObserver(_ observer: AnyObject)
    func removeAllObservers()
```

## UI Components
### AppButton
<p align="left">
 UIButton based class with useful extras.
 Can be used in conjunction with DecorateWrapper to automatic set different styles for all button states.
</p>

```swift
    var regularStyle: DecorateWrapper<AppButton>?
    var disabledStyle: DecorateWrapper<AppButton>?
    var highlightedStyle: DecorateWrapper<AppButton>?
```

<p align="left">
 Handling actions.
</p>

```swift
    let button = AppButton(title: "Action")
    button.addAction {}
    button.addTapAnimation(didHighlight: {}, didUnhighlight: {})
```

### Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/moslienko/AppViewUtilits.git", from: "1.2.5")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `AppViewUtilits`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate AppViewUtilits into your project manually. Simply drag the `Sources` Folder into your Xcode project.

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

