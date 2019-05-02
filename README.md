![titleGraniblelabelFullColor](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/titleGraniblelabelFullColor.png?raw=true)

# GranibleLabel

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/dokgi88/GranibleLabel/blob/master/LICENSE)

| top | left | right | bottom |
|:---:|:---:|:---:|:---:|
| ![top.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/top.gif?raw=true) | ![left.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/left.gif?raw=true) | ![right.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/right.gif?raw=true) | ![bottom.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/bottom.gif?raw=true) |

| leftTopDiagonal | leftBottomDiagonal | rightTopDiagonal | rightBottomDiagonal |
|:---:|:---:|:---:|:---:|
| ![leftTopDiagonal.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/leftTopDiagonal.gif?raw=true) | ![leftBottomDiagonal.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/leftBottomDiagonal.gif?raw=true) | ![rightTopDiagonal.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/rightTopDiagonal.gif?raw=true) | ![rightBottomDiagonal.gif](https://github.com/dokgi88/dokgi88.github.io/blob/master/_images/GranibleLabel/rightBottomDiagonal.gif?raw=true) |

## Install

```swift
pod 'GranibleLabel'
```

## Example

**_Up to 4 colors can be set._**

* Set no animation normal gradient
```swift
/* 
* .bottom, .leftTopDiagonal, etc...
*/ 
let label = GranibleLabel()
label.colors = [UIColor.red, UIColor.orange]
```

* Set animation direction
```swift
/* 
* direction = .bottom, .leftTopDiagonal, etc...
* animate default = false
*/
label.direction = .top
label.animate = true
```

* Set infinity animation
```swift
/* 
* If you set the first color and the last color the same, you can implement the infinity animation effect.
*/
label.colors = [UIColor.red, UIColor.orange, UIColor.red]
```

* Set auto reverses
```swift
/* 
* autoreverses default = false
*/
label.direction = .top
label.animate = true
label.autoreverses = true
```

* And other settings
```swift
/*
* You can use it just like a normal UILabel.
*/
label.text = "label"
label.textAlignment = .center
label.font = .boldSystemFont(ofSize: 10)
label.numberOfLines = 2
```

## License

GranibleLabel is available under the MIT license. See the LICENSE file for more info.
