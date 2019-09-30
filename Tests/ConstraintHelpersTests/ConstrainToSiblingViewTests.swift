//
//  ConstrainToSiblingViewTests.swift
//  
//
//  Created by Dillon McElhinney on 9/29/19.
//

@testable import ConstraintHelpers
import XCTest

class ConstrainToSiblingViewTests: XCTestCase {

    var sut: UIView!

    override func setUp() {
        super.setUp()
        sut = UIView()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // Test top constraint
    func testConstrainingTop() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .top
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .top
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, top: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with a top value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a top value should set a constraint whose first attribute is top")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a top value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a top value should set a constraint whose second attribute is top")
    }

    // Test bottom constraint
    func testConstrainingBottom() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .bottom
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .bottom
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, bottom: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with a bottom value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a bottom value should set a constraint whose first attribute is bottom")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a bottom value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a bottom value should set a constraint whose second attribute is bottom")
    }

    // Test leading constraint
    func testConstrainingLeading() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .leading
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .leading
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, leading: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with a leading value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a leading value should set a constraint whose first attribute is leading")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a leading value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a leading value should set a constraint whose second attribute is leading")
    }

    // Test trailing constraint
    func testConstrainingTrailing() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .trailing
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .trailing
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, trailing: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with a trailing value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a trailing value should set a constraint whose first attribute is trailing")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a trailing value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a trailing value should set a constraint whose second attribute is trailing")
    }

    // Test above constraint
    func testConstrainingAbove() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .top
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .bottom
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, above: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with an above value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with an above value should set a constraint whose first attribute is top")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with an above value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with an above value should set a constraint whose second attribute is bottom")
    }

    // Test below constraint
    func testConstrainingBelow() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .top
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .bottom
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, below: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with an below value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with an below value should set a constraint whose first attribute is top")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with an below value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with an below value should set a constraint whose second attribute is bottom")
    }

    // Test before constraint
    func testConstrainingBefore() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .leading
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .trailing
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, before: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with an before value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with an before value should set a constraint whose first attribute is leading")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with an before value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with an before value should set a constraint whose second attribute is trailing")
    }

    // Test behind constraint
    func testConstrainingBehind() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .leading
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .trailing
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, behind: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with an behind value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with an behind value should set a constraint whose first attribute is leading")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with an behind value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with an behind value should set a constraint whose second attribute is trailing")
    }

    // Test centerX constraint
    func testConstrainingCenterX() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .centerX
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .centerX
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, centerX: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with a centerX value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a centerX value should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a centerX value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a centerX value should set a constraint whose second attribute is centerX")
    }

    // Test centerY constraint
    func testConstrainingCenterY() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .centerY
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .centerY
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, centerY: expectedConstant)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedConstant, parentView.constraints.first?.constant, "Calling constrainToSiblingView with a centerY value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a centerY value should set a constraint whose first attribute is centerY")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a centerY value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a centerY value should set a constraint whose second attribute is centerY")
    }

    // Test equalHeight constraint
    func testConstrainingEqualHeight() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedMultiplier: CGFloat = 0.5
        let expectedAttribute: NSLayoutConstraint.Attribute = .height
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .height
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, equalHeight: expectedMultiplier)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedMultiplier, parentView.constraints.first?.multiplier, "Calling constrainToSiblingView with a equalHeight value should set the constant to \(expectedMultiplier)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a equalHeight value should set a constraint whose first attribute is height")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a equalHeight value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a equalHeight value should set a constraint whose second attribute is height")
    }

    // Test equalWidth constraint
    func testConstrainingEqualWidth() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedMultiplier: CGFloat = 0.5
        let expectedAttribute: NSLayoutConstraint.Attribute = .width
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .width
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        sut.constrainToSiblingView(view, equalWidth: expectedMultiplier)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "When constrainToSiblingView is called, translatesAutoresizingMaskIntoConstraints on the sut should be false.")
        XCTAssertEqual(expectedMultiplier, parentView.constraints.first?.multiplier, "Calling constrainToSiblingView with a equalWidth value should set the constant to \(expectedMultiplier)")
        XCTAssertEqual(expectedAttribute, parentView.constraints.first?.firstAttribute, "Calling constrainToSiblingView with a equalWidth value should set a constraint whose first attribute is width")
        XCTAssertEqual(expectedRelation, parentView.constraints.first?.relation, "Calling constrainToSiblingView with a equalWidth value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, parentView.constraints.first?.secondAttribute, "Calling constrainToSiblingView with a equalWidth value should set a constraint whose second attribute is width")
    }

    func testConstrainingToHeight() {
        // Given
        let parentView = UIView()
        let view = UIView()
        let expectedConstant: CGFloat = 50
        let expectedAttribute: NSLayoutConstraint.Attribute = .height
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        parentView.addSubview(view)
        parentView.addSubview(sut)

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSiblingView(sut, height: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToCenterIn is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(expectedConstant, view.constraints.first?.constant, "Calling constrainToCenterIn should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedAttribute, view.constraints.first?.firstAttribute, "Calling constrainToCenterIn should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedRelation, view.constraints.first?.relation, "Calling constrainToCenterIn  should set a constraint with an equal relation")
    }
}
