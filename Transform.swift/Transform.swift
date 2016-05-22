//
//  Transform.swift
//  Transform.swift
//
//  Created by Jeff Hurray on 5/21/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation
import CoreGraphics.CGAffineTransform

public enum Transform {
    
    case Indentity
    case Translate(tx: CGFloat, ty: CGFloat)
    case Scale(sx: CGFloat, sy: CGFloat)
    case Rotate(rotation: Rotation)
    case Init(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat, tx: CGFloat, ty: CGFloat)
    case Custom(t: CGAffineTransform)
    
    var CGATransform : CGAffineTransform {
        return self.underlyingTransform()
    }
    
    var isIdentity: Bool {
        return CGAffineTransformIsIdentity(self.CGATransform)
    }
    
    var inverted: Transform {
        return Transform.Custom(t: CGAffineTransformInvert(self.CGATransform))
    }
    
    mutating func append(t: Transform) {
        self = Transform.Custom(t: CGAffineTransformConcat(self.CGATransform, t.CGATransform))
    }
    
    func transformedRect(rect: CGRect) -> CGRect {
        return CGRectApplyAffineTransform(rect, self.CGATransform)
    }
    
    func transformedSize(size: CGSize) -> CGSize {
        return CGSizeApplyAffineTransform(size, self.CGATransform)
    }
    
    func transformedPoint(point: CGPoint) -> CGPoint {
        return CGPointApplyAffineTransform(point, self.CGATransform)
    }
    
    internal func underlyingTransform() -> CGAffineTransform {
        switch self {
        case .Indentity:
            return CGAffineTransformIdentity
        case .Scale(let sx, let sy):
            return CGAffineTransformMakeScale(sx, sy)
        case .Translate(let tx, let ty):
            return CGAffineTransformMakeTranslation(tx, ty)
        case .Rotate(let rotation):
            return CGAffineTransformMakeRotation(rotation.radians())
        case .Custom(let t):
            return t
        case .Init(let a, let b, let c, let d, let tx, let ty):
            return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
        }
    }
}
