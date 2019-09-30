//
//  ConstrainToSuperViewTests.swift
//  
//
//  Created by Dillon McElhinney on 9/29/19.
//

@testable import ConstraintHelpers
import XCTest

class ConstrainToSuperViewTests: XCTestCase {

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
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .top
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .top

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, top: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, sut.constraints.first?.constant, "Calling constrainToSuperView with a top value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a top value should set a constraint whose first attribute is top")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a top value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a top value should set a constraint whose second attribute is top")
    }

    // Test bottom constraint
    func testConstrainingBottom() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .bottom
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .bottom

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, bottom: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, sut.constraints.first?.constant, "Calling constrainToSuperView with a bottom value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a bottom value should set a constraint whose first attribute is bottom")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a bottom value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a bottom value should set a constraint whose second attribute is bottom")
    }

    // Test leading constraint
    func testConstrainingLeadingEdge() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .leading
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .leading

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, leading: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, sut.constraints.first?.constant, "Calling constrainToSuperView with a leading value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a leading value should set a constraint whose first attribute is leading")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a leading value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a leading value should set a constraint whose second attribute is leading")
    }

    // Test trailing constraint
    func testConstrainingTrailingEdge() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .trailing
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .trailing

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, trailing: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, sut.constraints.first?.constant, "Calling constrainToSuperView with a trailing value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a trailing value should set a constraint whose first attribute is trailing")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a trailing value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a trailing value should set a constraint whose second attribute is trailing")
    }

    // Test centerX constraint
    func testConstrainingCenterX() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .centerX
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .centerX

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, centerX: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, sut.constraints.first?.constant, "Calling constrainToSuperView with a centerX value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a centerX value should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a centerX value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a centerX value should set a constraint whose second attribute is centerX")
    }

    // Test centerY constraint
    func testConstrainingCenterY() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .centerY
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .centerY

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, centerY: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, sut.constraints.first?.constant, "Calling constrainToSuperView with a centerY value should set the constant to \(expectedConstant)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a centerY value should set a constraint whose first attribute is centerY")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a centerY value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a centerY value should set a constraint whose second attribute is centerY")
    }

    // Test equalHeight constraint
    func testConstrainingEqualHeight() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedMultiplier: CGFloat = 0.5
        let expectedAttribute: NSLayoutConstraint.Attribute = .height
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .height

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, equalHeight: expectedMultiplier)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedMultiplier, sut.constraints.first?.multiplier, "Calling constrainToSuperView with a equalHeight value should set the constant to \(expectedMultiplier)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a equalHeight value should set a constraint whose first attribute is height")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a equalHeight value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a equalHeight value should set a constraint whose second attribute is height")
    }

    // Test equalWidth constraint
    func testConstrainingEqualWidth() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedMultiplier: CGFloat = 0.5
        let expectedAttribute: NSLayoutConstraint.Attribute = .width
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .width

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, equalWidth: expectedMultiplier)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToSuperView is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToSuperView is called, the view should be added as a subview.")
        XCTAssertEqual(expectedMultiplier, sut.constraints.first?.multiplier, "Calling constrainToSuperView with a equalWidth value should set the constant to \(expectedMultiplier)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainToSuperView with a equalWidth value should set a constraint whose first attribute is width")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainToSuperView with a equalWidth value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.first?.secondAttribute, "Calling constrainToSuperView with a equalWidth value should set a constraint whose second attribute is width")
    }

    // Test safeArea = true
    func testConstrainingWithSafeArea() {
        // Given
        let view = UIView()
        let expectedConstant: CGFloat = 10

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, safeArea: true, top: expectedConstant)

        // Then
        if #available(iOS 11.0, *) {
            XCTAssertEqual(sut.safeAreaLayoutGuide, sut.constraints.first?.secondItem as? UILayoutGuide, "Calling constrainToSuperView with safeArea set to true should set a constraint whose second item is the safeAreaLayoutGuide")
        } else {
            XCTAssertEqual(sut, sut.constraints.first?.secondItem as? UIView, "Calling constrainToSuperView with safeArea set to true on a device running on OS earlier than 11.0 should set a constraint whose second item is the sut")
        }
    }

    // Test safeArea = false
    func testConstrainingEdgesWithoutSafeArea() {
        // Given
        let view = UIView()

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToFill(sut, safeArea: false)

        // Then
        XCTAssertEqual(sut, sut.constraints.first?.secondItem as? UIView, "Calling constrainToSuperView with safeArea set to false should set a constraint whose second item is the sut")
    }

    func testConstrainingEqualWidthsWithoutSafeArea() {
        // Given
        let view = UIView()

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, safeArea: false, equalHeight: 1, equalWidth: 1)

        // Then
        XCTAssertEqual(sut, sut.constraints.first?.secondItem as? UIView, "Calling constrainToSuperView with safeArea set to false should set a constraint whose second item is the sut")
    }

    // Test constrain to center in
    func testConstrainingToCenter() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedAttribute1: NSLayoutConstraint.Attribute = .centerX
        let expectedRelation1: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute1: NSLayoutConstraint.Attribute = .centerX
        let expectedAttribute2: NSLayoutConstraint.Attribute = .centerY
        let expectedRelation2: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute2: NSLayoutConstraint.Attribute = .centerY

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToCenterIn(sut)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToCenterIn is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToCenterIn is called, the view should be added as a subview.")
        XCTAssertEqual(expectedAttribute1, sut.constraints.first?.firstAttribute, "Calling constrainToCenterIn should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedRelation1, sut.constraints.first?.relation, "Calling constrainToCenterIn  should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute1, sut.constraints.first?.secondAttribute, "Calling constrainToCenterIn should set a constraint whose second attribute is centerX")
        XCTAssertEqual(expectedAttribute2, sut.constraints[1].firstAttribute, "Calling constrainToCenterIn should set a constraint whose first attribute is centerY")
        XCTAssertEqual(expectedRelation2, sut.constraints[1].relation, "Calling constrainToCenterIn should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute2, sut.constraints[1].secondAttribute, "Calling constrainToCenterIn should set a constraint whose second attribute is centerY")
    }

    func testConstrainingToHeightAndWidth() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID
        let expectedConstant: CGFloat = 50
        let expectedAttribute: NSLayoutConstraint.Attribute = .height
        let expectedRelation: NSLayoutConstraint.Relation = .equal

        // When
        // Tests are called on view with sut, because constraints live in the superview.
        view.constrainToSuperView(sut, height: expectedConstant)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When constrainToCenterIn is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When constrainToCenterIn is called, the view should be added as a subview.")
        XCTAssertEqual(expectedConstant, view.constraints.first?.constant, "Calling constrainToCenterIn should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedAttribute, view.constraints.first?.firstAttribute, "Calling constrainToCenterIn should set a constraint whose first attribute is centerX")
        XCTAssertEqual(expectedRelation, view.constraints.first?.relation, "Calling constrainToCenterIn  should set a constraint with an equal relation")
    }
}
