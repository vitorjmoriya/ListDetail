// ListDetailUITests.swift

import XCTest

final class ListDetailUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTabBarItemsCount() throws {
        let tabBar = app.tabBars.element
        XCTAssertEqual(tabBar.buttons.count, 2, "Expected two tab bar items")
    }

    func testNavigateToJSONListAndPressFirstItem() throws {
        let tabBar = app.tabBars.element
        let secondTabBarItem = tabBar.buttons.element(boundBy: 1)
        secondTabBarItem.tap()

        app.buttons.element(boundBy: tabBar.buttons.count).tap()
    }
}
