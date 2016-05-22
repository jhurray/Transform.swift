# Transform.swift

Transform.swift offers a *Swiftier* API for applying transforms to UIView and its subclasses.

```swift 
let scale = Transform.Scale(sx: 0.5, sy: 0.5)
let rotate = Transform.Rotate(rotation: .Degrees(45))
let scaleAndRotate = scale + rotate
myView.transform += scaleAndRotate

myView.transform3D = .Translate(tx: 40, ty: 0, tz: 100).CATransform
```

<p align="center">

<a href="http://cocoapods.org/pods/Transform.swift"><img src="https://img.shields.io/cocoapods/v/Transform.swift.svg?style=flat"></a>

<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>

<a href="https://img.shields.io/cocoapods/p/Transform.swift.svg?style=flat"><img src="https://img.shields.io/cocoapods/p/Transform.swift.svg?style=flat"></a>

<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat"></a>

</p>

##Instalation

####[CocoaPods](https://cocoapods.org/)

Add the following to your **Podfile**:

```ruby
use_frameworks!

pod 'Transform.swift', '~> 0.1.1'
```

####[Carthage](https://github.com/Carthage/Carthage)

Add the following to your **Cartfile**:

```
gitub "jhurray/Transform.swift" ~> 0.1.1
```

##Usage

**Transform.swift** exposes 3 enums, `Transform`, `Transform3D`, and `Rotation`.

###Rotation
A convenience enum that allows the developer to easily define the rotation they want. The cases are pretty self explanitory.

* `.Degrees(degrees: CGFloat)`
* `.Radians(radians: Double)`
   * Takes a double to make it easier to pass the `M_PI` definitions from `Darwin.C.Math` 

###Transform

* `.Identity`
* `.Translate(tx: CGFloat, ty: CGFloat)`
* `.Scale(sx: CGFloat, sy: CGFloat)`
* `.Rotate(rotation: Rotation)`
* `.Init(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat, tx: CGFloat, ty: CGFloat)` for the adventurous type 😎
* `Custom(t: CGAffineTransform)`

####Methods

A group of methods that calculate how the transform affects a `CGRect`, `CGSize`, and `CGPoint` respectively.

```swift
public func transformedRect(rect: CGRect) -> CGRect
public func transformedSize(size: CGSize) -> CGSize
public func transformedPoint(point: CGPoint) -> CGPoint
```

Returns the underlying `CGAffineTransform`

```swift
public var CGATransform: CGAffineTransform { get }
```

###Transform3D

* `.Identity`
* `.Translate(tx: CGFloat, ty: CGFloat, tz: CGFloat)`
* `.Scale(sx: CGFloat, sy: CGFloat, sz: CGFloat)`
* `.Rotate(rotation: Rotation, x: CGFloat, y: CGFloat, z: CGFloat)`
* `.Affine(t: CGAffineTransform)`
* `.Custom(t: CATransform3D)`

####Methods

Returns the underlying `CATransform3D`

```swift
public var CATransform : CATransform3D { get }
```

Returns a `true` if the 3d transform can be converted into an affine transform, `false` if it cannot.

```swift
public var isAffine: Bool { get }
```

Returns the underlying `CGAffineTransform`. Will throw an error if the 3D transform cannot be converted into an affine transform. 

```swift
public func affineTransform() throws -> CGAffineTransform 
```

###Shared Utilities

* Inverting: `let inverted = t.inverted`
* Identity Conformation: `let isIdentity = t.isIdentity`
* Concatenation: `let scaleAndMove = .Scale(sx: 0.5, sy:1).concat(.Translate(tx: 40, ty: -100))`

###Operators

* `==` Equality 
   * Returns `Bool`
   * `Transform` == `Transform`
   * `Transform` == `CGAffineTransform`
   * `Transform3D` == `Transform3D`
   * `Transform3D` == `CATransform3D`
* `+` Additive
   * Returns the type being added 
   * `Transform` + `Transform`
   * `CGAffineTransform` + `CGAffineTransform`
   * `Transform3D` + `Transform3D`
   * `CATransform3D` + `CATransform3D`
* `+=` Assignment
   * Modifies the left variable of the operator
   * `Transform` += `Transform`
   * `CGAffineTransform` += `Transform`
   * `Transform3D` += `Transform3D`
   * `CATransform3D` += `Transform3D` 
* `<-` Assignment
   * Assigns a value to the left variable of the operator 
   * `CGAffineTransform` <- `Transform`
   * `CATransform3D` <- `Transform3D`
   * Semantics to assign the transform enum to the old API since you cant overload the `=` operator.

###UIView Extension
2 Variables have been added to `UIView` to add settable and gettable interfaces for `Transform` and `Transform3D`.

```swift
var affineTransform: Transform
var transform3D: Transform3D
```

##Contact Info
Feel free to email me at [jhurray33@gmail.com](mailto:jhurray33@gmail.com?subject=Transform.swift). I'd love to hear your thoughts on this, or see examples where this has been used.

You can also hit me up on twitter [@JeffHurray](https://twitter.com/JeffHurray).

##Contributing
If you want to add functionality please open an issue and/or create a pull request.


##License
Transform.swift is available under the MIT license. See the LICENSE file for more information.