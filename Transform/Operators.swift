//
//  Operators.swift
//  Transform.swift
//
//  Created by Jeff Hurray on 5/21/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation
import CoreGraphics.CGAffineTransform
import QuartzCore

// MARK: Equality

internal func == (lhs: CGAffineTransform, rhs: CGAffineTransform) -> Bool {
    return CGAffineTransformEqualToTransform(lhs, rhs)
}

internal func == (lhs: CATransform3D, rhs: CATransform3D) -> Bool {
    return CATransform3DEqualToTransform(lhs, rhs)
}

public func == (lhs: Transform, rhs: Transform) -> Bool {
    return lhs.CGATransform == rhs.CGATransform
}

public func == (lhs: Transform, rhs: CGAffineTransform) -> Bool {
    return lhs.CGATransform == rhs
}

public func == (lhs: CGAffineTransform, rhs: Transform) -> Bool {
    return lhs == rhs.CGATransform
}

public func == (lhs: Transform3D, rhs: Transform3D) -> Bool {
    return lhs.CATransform == rhs.CATransform
}

public func == (lhs: Transform3D, rhs: CATransform3D) -> Bool {
    return lhs.CATransform == rhs
}

public func == (lhs: CATransform3D, rhs: Transform3D) -> Bool {
    return lhs == rhs.CATransform
}


// MARK: Additive

public func + (lhs: Transform, rhs: Transform) -> Transform {
    return Transform.Custom(t: CGAffineTransformConcat(lhs.underlyingTransform(), rhs.underlyingTransform()))
}

public func + (lhs: Transform3D, rhs: Transform3D) -> Transform3D {
    return Transform3D.Custom(t: CATransform3DConcat(lhs.underlyingTransform(), rhs.underlyingTransform()))
}

public func + (lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
    return CGAffineTransformConcat(lhs, rhs)
}

public func + (lhs: CATransform3D, rhs: CATransform3D) -> CATransform3D {
    return CATransform3DConcat(lhs, rhs)
}

// MARK: Assignment

public func += (inout lhs: Transform, rhs: Transform) {
    lhs.concat(lhs)
}

public func += (inout lhs: Transform3D, rhs: Transform3D) {
    lhs.concat(lhs)
}

public func += (inout lhs: CGAffineTransform, rhs: Transform) {
    lhs = CGAffineTransformConcat(lhs, rhs.underlyingTransform())
}

public func += (inout lhs: CATransform3D, rhs: Transform3D) {
    lhs = CATransform3DConcat(lhs, rhs.underlyingTransform())
}

infix operator <- { associativity right precedence 90 }

public func <- (inout lhs: CGAffineTransform, rhs: Transform) {
    lhs = rhs.underlyingTransform()
}

public func <- (inout lhs: CATransform3D, rhs: Transform3D) {
    lhs = rhs.underlyingTransform()
}

