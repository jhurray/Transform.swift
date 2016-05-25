//
//  Transform3D.swift
//  Transform.swift
//
//  Created by Jeff Hurray on 5/21/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation
import QuartzCore

public enum Transform3DError: ErrorType {
    case NotAffineError
}

public enum Transform3D {
    case indentity
    case translate(tx: CGFloat, ty: CGFloat, tz: CGFloat)
    case scale(sx: CGFloat, sy: CGFloat, sz: CGFloat)
    case rotate(rotation: Rotation, x: CGFloat, y: CGFloat, z: CGFloat)
    case affine(t: CGAffineTransform)
    case custom(t: CATransform3D)
    
    public var CATransform : CATransform3D {
        return self.underlyingTransform()
    }
    
    public var isAffine: Bool {
        return CATransform3DIsAffine(self.CATransform)
    }
    
    public func affineTransform() throws -> CGAffineTransform {
        if self.isAffine {
            return CATransform3DGetAffineTransform(self.CATransform)
        }
        else {
            throw Transform3DError.NotAffineError
        }
    }
    
    public var isIdentity: Bool {
        return CATransform3DIsIdentity(self.CATransform)
    }
    
    public var inverted: Transform3D {
        return .custom(t: CATransform3DInvert(self.CATransform))
    }
    
    public mutating func concat(t: Transform3D) {
        self = .custom(t: CATransform3DConcat(self.CATransform, t.CATransform))
    }
    
    internal func underlyingTransform() -> CATransform3D {
        switch self {
        case .indentity:
            return CATransform3DIdentity
        case .scale(let sx, let sy, let sz):
            return CATransform3DMakeScale(sx, sy, sz)
        case .translate(let tx, let ty, let tz):
            return CATransform3DMakeTranslation(tx, ty, tz)
        case .rotate(let rotation, let x, let y, let z):
            return CATransform3DMakeRotation(rotation.radians, x, y, z)
        case .custom(let t):
            return t
        case .affine(let t):
            return CATransform3DMakeAffineTransform(t)
        }
    }
}
