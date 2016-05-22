//
//  UIView+Transform3D.swift
//  Transform.swift
//
//  Created by Jeff Hurray on 5/22/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit

extension UIView {
    
    var affineTransform: Transform {
        get {
            return Transform.Custom(t: self.transform)
        }
        set {
            self.transform = newValue.underlyingTransform()
        }
    }
    
    var transform3D: Transform3D {
        get {
            return Transform3D.Custom(t: self.layer.transform)
        }
        set {
            self.layer.transform = newValue.underlyingTransform()
        }
    }
}
    
#endif