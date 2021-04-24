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

## Helpers

### AppViewController


### AppVersion
Application version information

```swift
       AppVersion.getInfo()
```

Result

```swift
      struct Info {
        var appName: String
        var version: String
        var build: String
        var target: String
    }
```

### AppOutletsActions
Handling button or view taps

```swift
        button.addAction {
            ...
        }
        button.addAction(for: .touchDown) {
            ...
        }
        button.tapBegin {
            ...
        }
        button.tapEnd {
            ...
        }
```

```swift
        view.addAction {
            ...
        }
```


### Decorate

Wrapper for setting UI element styles

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

Example call

```swift
		label.decorate(.headerStyle())
```

### Environment

```swift
        Environment.current
```

Result

```swift
 enum Environment {
    case debug
    case release
    case testFlight
}
```



















### Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/moslienko/AppViewUtilits.git", from: "1.2.0")
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
