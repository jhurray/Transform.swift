//: Playground - noun: a place where people can play

import XCPlayground
import UIKit
import Transform

let animated = false

let container = UIView()
container.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
container.backgroundColor = .greenColor()
XCPlaygroundPage.currentPage.liveView = container

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = .blueColor()
container.addSubview(view)

let transforms = {
    view.transform += .scale(sx: 2.0, sy: 2.0)
    view.transform += .translate(tx: 100, ty: 100)
    view.layer.transform += Transform3D.rotate(rotation: .degrees(60), x: 0, y: 1, z: 0)
}

if animated {
    UIView.animateWithDuration(1.5) {
        transforms()
    }
}
else {
    transforms()
}
