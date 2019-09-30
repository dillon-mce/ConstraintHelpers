//
//  ConstrainSelfTests.swift
//  
//
//  Created by Dillon McElhinney on 9/29/19.
//

@testable import ConstraintHelpers
import XCTest

class ConstrainSelfTests: XCTestCase {

    var sut: UIView!

    override func setUp() {
        super.setUp()
        sut = UIView()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testConstrainingHeight() {
        // Given
        let expectedHeight: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .height
        let expectedRelation: NSLayoutConstraint.Relation = .equal

        // When
        sut.constrainSelf(height: expectedHeight)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "Calling constrainSelf should set translatesAutoresizingMaskIntoConstraints on the view to be false.")
        XCTAssertEqual(expectedHeight, sut.constraints.first?.constant, "Calling constrainSelf with a height value should set the constant to \(expectedHeight)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainSelf with a height value should set the height attribute")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainSelf with a height value should set a constraint with an equal relation")
    }

    func testConstrainingWidth() {
        // Given
        let expectedWidth: CGFloat = 10
        let expectedAttribute: NSLayoutConstraint.Attribute = .width
        let expectedRelation: NSLayoutConstraint.Relation = .equal

        // When
        sut.constrainSelf(width: expectedWidth)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "Calling constrainSelf should set translatesAutoresizingMaskIntoConstraints on the view to be false.")
        XCTAssertEqual(expectedWidth, sut.constraints.first?.constant, "Calling constrainSelf with a width value should set the constant to \(expectedWidth)")
        XCTAssertEqual(expectedAttribute, sut.constraints.first?.firstAttribute, "Calling constrainSelf with a width value should set the width attribute")
        XCTAssertEqual(expectedRelation, sut.constraints.first?.relation, "Calling constrainSelf with a width value should set a constraint with an equal relation")
    }

    func testConstrainingAspectHeight() {
        // Given
        let expectedMultiplier: CGFloat = 2
        let expectedAttribute: NSLayoutConstraint.Attribute = .width
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .height

        // When
        sut.constrainSelf(aspectHeight: expectedMultiplier)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "Calling constrainSelf should set translatesAutoresizingMaskIntoConstraints on the view to be false.")
        XCTAssertEqual(expectedMultiplier, sut.constraints.last?.multiplier, "Calling constrainSelf with an aspectHeight value should set the multiplier to \(expectedMultiplier)")
        XCTAssertEqual(expectedAttribute, sut.constraints.last?.firstAttribute, "Calling constrainSelf with an aspectHeight value should set the width attribute")
        XCTAssertEqual(expectedRelation, sut.constraints.last?.relation, "Calling constrainSelf with an aspectHeight value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.last?.secondAttribute, "Calling constrainSelf with an aspectHeight value should result in a constraint whose second attribute is height")
    }

    func testConstrainingAspectWidth() {
        // Given
        let expectedMultiplier: CGFloat = 2
        let expectedAttribute: NSLayoutConstraint.Attribute = .height
        let expectedRelation: NSLayoutConstraint.Relation = .equal
        let expectedSecondAttribute: NSLayoutConstraint.Attribute = .width

        // When
        sut.constrainSelf(aspectWidth: expectedMultiplier)

        // Then
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "Calling constrainSelf should set translatesAutoresizingMaskIntoConstraints on the view to be false.")
        XCTAssertEqual(expectedMultiplier, sut.constraints.last?.multiplier, "Calling constrainSelf with an aspectWidth value should set the multiplier to \(expectedMultiplier)")
        XCTAssertEqual(expectedAttribute, sut.constraints.last?.firstAttribute, "Calling constrainSelf with an aspectWidth value should set the height attribute")
        XCTAssertEqual(expectedRelation, sut.constraints.last?.relation, "Calling constrainSelf with an aspectWidth value should set a constraint with an equal relation")
        XCTAssertEqual(expectedSecondAttribute, sut.constraints.last?.secondAttribute, "Calling constrainSelf with an aspectWidth value should set a constraint whose second attribute is width")
    }
}
