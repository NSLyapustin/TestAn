//
//  TestsTemplate.swift
//  TestAn
//
//  Created by n.lyapustin on 12.06.2022.
//

import Foundation

struct TestsTemplate {
    static let header = """
import Foundation
import XCTest

class TestCaseBase: XCTestCase {

    var app: XCUIApplication!
    var analytics: AnalyticsTestBase!

    override func setUp() {
        super.setUp()

        app = XCUIApplication()
        analytics = AnalyticsTestBase(app: app)
    }

    /// Launching app for UI-testing with written parameters.
    func launchApp(with parameters: AppLaunchParameters = AppLaunchParameters()) {
        app.launchArguments = parameters.launchArguments
        app.launch()
    }

"""

    static let test = """
    func test_INSERT_EVENT_NAME() {
        launchApp(with: AppLaunchParameters(sendMetricsToPasteboard: true))

        // insert actions to event

        analytics.assertContains(name: "INSERT_EVENT_NAME")
    }

"""

    static let footer = """
}
"""
}
