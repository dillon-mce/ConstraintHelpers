//
//  AddSubviewTests.swift
//  
//
//  Created by Dillon McElhinney on 9/29/19.
//

@testable import ConstraintHelpers
import XCTest

final class AddConstrainedSubviewTests: XCTestCase {

    var sut: UIView!

    override func setUp() {
        super.setUp()
        sut = UIView()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddingSubview() {
        // Given
        let view = UIView()
        let givenID = "Subview"
        view.accessibilityIdentifier = givenID

        // When
        sut.addConstrainedSubview(view)

        // Then
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "When addConstrainedSubview is called, translatesAutoresizingMaskIntoConstraints on the view should be false.")
        XCTAssertEqual(givenID, sut.subviews.first?.accessibilityIdentifier, "When addConstrainedSubview is called, the view should be added as a subview.")
    }

    static var allTests = [
        ("testAddingSubview", testAddingSubview)
    ]

}
