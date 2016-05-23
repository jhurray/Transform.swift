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
    case Indentity
    case Translate(tx: CGFloat, ty: CGFloat, tz: CGFloat)
    case Scale(sx: CGFloat, sy: CGFloat, sz: CGFloat)
    case Rotate(rotation: Rotation, x: CGFloat, y: CGFloat, z: CGFloat)
    case Affine(t: CGAffineTransform)
    case Custom(t: CATransform3D)
    
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
        return Transform3D.Custom(t: CATransform3DInvert(self.CATransform))
    }
    
    public mutating func concat(t: Transform3D) {
        self = Transform3D.Custom(t: CATransform3DConcat(self.CATransform, t.CATransform))
    }
    
    internal func underlyingTransform() -> CATransform3D {
        switch self {
        case .Indentity:
            return CATransform3DIdentity
        case .Scale(let sx, let sy, let sz):
            return CATransform3DMakeScale(sx, sy, sz)
        case .Translate(let tx, let ty, let tz):
            return CATransform3DMakeTranslation(tx, ty, tz)
        case .Rotate(let rotation, let x, let y, let z):
            return CATransform3DMakeRotation(rotation.radians(), x, y, z)
        case .Custom(let t):
            return t
        case .Affine(let t):
            return CATransform3DMakeAffineTransform(t)
        }
    }
}
