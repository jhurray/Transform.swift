//
//  Rotation.swift
//  Transform.swift
//
//  Created by Jeff Hurray on 5/21/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation
import GLKit.GLKMathUtils

public enum Rotation {
    
    case Degrees(CGFloat)
    // Using Double type to support 𝞹 definitions in Darwin.C.Math
    case Radians(Double)
    
    internal func radians() -> CGFloat {
        switch self {
        case .Degrees(let degrees):
            return CGFloat(GLKMathDegreesToRadians(Float(degrees)))
        case .Radians(let radians):
            return CGFloat(radians)
        }
    }
}