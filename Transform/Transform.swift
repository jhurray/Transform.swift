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
    
    case indentity
    case translate(tx: CGFloat, ty: CGFloat)
    case scale(sx: CGFloat, sy: CGFloat)
    case rotate(rotation: Rotation)
    case `init`(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat, tx: CGFloat, ty: CGFloat)
    case custom(t: CGAffineTransform)
    
    public var CGATransform : CGAffineTransform {
        return self.underlyingTransform()
    }
    
    public var isIdentity: Bool {
        return CGAffineTransformIsIdentity(self.CGATransform)
    }
    
    public var inverted: Transform {
        return .custom(t: CGAffineTransformInvert(self.CGATransform))
    }
    
    public mutating func concat(t: Transform) {
        
        self = .custom(t: CGAffineTransformConcat(self.CGATransform, t.CGATransform))
    }
    
    public func transformedRect(rect: CGRect) -> CGRect {
        return CGRectApplyAffineTransform(rect, self.CGATransform)
    }
    
    public func transformedSize(size: CGSize) -> CGSize {
        return CGSizeApplyAffineTransform(size, self.CGATransform)
    }
    
    public func transformedPoint(point: CGPoint) -> CGPoint {
        return CGPointApplyAffineTransform(point, self.CGATransform)
    }
    
    internal func underlyingTransform() -> CGAffineTransform {
        switch self {
        case .indentity:
            return CGAffineTransformIdentity
        case .scale(let sx, let sy):
            return CGAffineTransformMakeScale(sx, sy)
        case .translate(let tx, let ty):
            return CGAffineTransformMakeTranslation(tx, ty)
        case .rotate(let rotation):
            return CGAffineTransformMakeRotation(rotation.radians)
        case .custom(let t):
            return t
        case .init(let a, let b, let c, let d, let tx, let ty):
            return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
        }
    }
}
