//
//  TransformTests_iOS.swift
//  TransformTests iOS
//
//  Created by Jeff Hurray on 5/21/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import XCTest
import GLKit.GLKMathUtils
@testable import Transform

class TransformTests: XCTestCase {
    
    func testOperator() {
        var identity = CGAffineTransformIdentity
        let transform = Transform.Scale(sx: 1.0, sy: 2.0)
        identity += transform
        XCTAssertTrue(CGAffineTransformEqualToTransform(identity, transform.underlyingTransform()))
    }
    
    func testWithView() {
        let transform = Transform.Scale(sx: 1.0, sy: 2.0)
        let view = UIView()
        view.transform += transform
        XCTAssertTrue(CGAffineTransformEqualToTransform(view.transform, transform.underlyingTransform()))
    }
    
    func testIdentity() {
        XCTAssertTrue(CGAffineTransformIdentity == Transform.Indentity.CGATransform)
        XCTAssertTrue(Transform.Indentity.isIdentity)
    }
    
    func testTranslation() {
        let t1 = CGAffineTransformMakeTranslation(100, -100)
        let t2 = Transform.Translate(tx: 100, ty: -100)
        XCTAssertTrue(t1 == t2)
    }
    
    func testScale() {
        let t1 = CGAffineTransformMakeScale(100, -100)
        let t2 = Transform.Scale(sx: 100, sy: -100)
        XCTAssertTrue(t1 == t2)
    }
    
    func testRotate() {
        let t1 = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        let t2 = Transform.Rotate(rotation: .Radians(M_PI_2))
        XCTAssertTrue(t1 == t2)
    }
    
    func testInit() {
        let t1 = CGAffineTransformMake(1, 2, 3, 4, 5, 6)
        let t2 = Transform.Init(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        XCTAssertTrue(t1 == t2)
    }
    
    func testCustom() {
        let t1 = CGAffineTransformMake(1, 2, 3, 4, 5, 6)
        let t2 = Transform.Custom(t: t1)
        XCTAssertTrue(t1 == t2)
    }
    
    func testInverted() {
        let t1 = CGAffineTransformMake(1, 2, 3, 4, 5, 6)
        let t2 = Transform.Custom(t: t1)
        XCTAssertTrue(CGAffineTransformInvert(t1) == t2.inverted)
    }
    
    func testAppend() {
        let t1a = CGAffineTransformMakeScale(100, -100)
        let t1b = CGAffineTransformMakeTranslation(100, -100)
        let t1 = t1a + t1b
        let t2 = .Scale(sx: 100, sy: -100) + .Translate(tx: 100, ty: -100)
        XCTAssertTrue(t1 == t2)
    }
    
    func testRectAfterTransform() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let t = .Translate(tx: 40, ty: -40) + .Scale(sx: -1, sy: -2)
        let r1 = CGRectApplyAffineTransform(rect, CGAffineTransformConcat(CGAffineTransformMakeTranslation(40, -40), CGAffineTransformMakeScale(-1, -2)))
        let r2 = t.transformedRect(rect)
        XCTAssertTrue(CGRectEqualToRect(r1, r2))
    }
    
    func testPointAfterTransform() {
        let point = CGPoint(x: 20, y: -100)
        let t = .Translate(tx: 40, ty: -40) + .Scale(sx: -1, sy: -2)
        let p1 = CGPointApplyAffineTransform(point, CGAffineTransformConcat(CGAffineTransformMakeTranslation(40, -40), CGAffineTransformMakeScale(-1, -2)))
        let p2 = t.transformedPoint(point)
        XCTAssertTrue(CGPointEqualToPoint(p1, p2))
    }
    
    func testSizeAfterTransform() {
        let size = CGSize(width: 100, height: 200)
        let t = .Translate(tx: 40, ty: -40) + .Scale(sx: -1, sy: -2)
        let s1 = CGSizeApplyAffineTransform(size, CGAffineTransformConcat(CGAffineTransformMakeTranslation(40, -40), CGAffineTransformMakeScale(-1, -2)))
        let s2 = t.transformedSize(size)
        XCTAssertTrue(CGSizeEqualToSize(s1, s2))
    }
}






