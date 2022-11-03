/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import XCTest

class OnboardingUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app = XCUIApplication()
    }

    func testGoingThroughOnboarding() {
        app.launch()
        app.buttons["loginButton"].tap()
    }
}
