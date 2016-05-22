//
//  Transform3DTests.swift
//  Transform.swift
//
//  Created by Jeff Hurray on 5/22/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import XCTest
@testable import Transform

class Transform3DTests: XCTestCase {

    func testOperator() {
        var identity = CATransform3DIdentity
        let transform = Transform3D.Scale(sx: 1, sy: 1, sz: 1)
        identity += transform
        XCTAssertTrue(CATransform3DEqualToTransform(identity, transform.underlyingTransform()))
    }
    
    func testWithView() {
        let transform = Transform3D.Scale(sx: 1.0, sy: -2.0, sz: 3.0)
        let view = UIView()
        view.layer.transform += transform
        XCTAssertTrue(CATransform3DEqualToTransform(view.layer.transform, transform.underlyingTransform()))
    }
    
    func testIdentity() {
        XCTAssertTrue(CATransform3DIdentity == Transform3D.Indentity.CATransform)
        XCTAssertTrue(Transform.Indentity.isIdentity)
    }
    
    func testTranslation() {
        let t1 = CATransform3DMakeTranslation(100, -100, 200)
        let t2 = Transform3D.Translate(tx: 100, ty: -100, tz: 200)
        XCTAssertTrue(t1 == t2)
    }
    
    func testScale() {
        let t1 = CATransform3DMakeScale(100, -100, 200)
        let t2 = Transform3D.Scale(sx: 100, sy: -100, sz: 200)
        XCTAssertTrue(t1 == t2)
    }
    
    func testRotate() {
        let t1 = CATransform3DMakeRotation(CGFloat(M_PI_2), 0.5, -0.5, 0)
        let t2 = Transform3D.Rotate(rotation: .Radians(M_PI_2), x: 0.5, y: -0.5, z: 0)
        XCTAssertTrue(t1 == t2)
    }
    
    func testAffine() {
        let t1 = CATransform3DMakeAffineTransform(CGAffineTransformMake(1, 2, 3, 4, 5, 6))
        let t2 = Transform3D.Affine(t: CGAffineTransformMake(1, 2, 3, 4, 5, 6))
        XCTAssertTrue(t1 == t2)
    }
    
    func testCustom() {
        let t1 = CATransform3DMakeAffineTransform(CGAffineTransformMake(1, 2, 3, 4, 5, 6))
        let t2 = Transform3D.Custom(t: t1)
        XCTAssertTrue(t1 == t2)
    }
    
    func testInverted() {
        let t1 = CATransform3DMakeAffineTransform(CGAffineTransformMake(1, 2, 3, 4, 5, 6))
        let t2 = Transform3D.Custom(t: t1)
        XCTAssertTrue(CATransform3DInvert(t1) == t2.inverted)
    }
    
    func testAppend() {
        let t1a = CATransform3DMakeScale(100, -100, 200)
        let t1b = CATransform3DMakeTranslation(100, -100, 200)
        let t1 = t1a + t1b
        let t2: Transform3D = .Scale(sx: 100, sy: -100, sz: 200) + .Translate(tx: 100, ty: -100, tz: 200)
        XCTAssertTrue(t1 == t2)
    }

}
