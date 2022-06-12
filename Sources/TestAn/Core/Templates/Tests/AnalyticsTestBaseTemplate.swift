//
//  AnalyticsTestBaseTemplate.swift
//  TestAn
//
//  Created by n.lyapustin on 12.06.2022.
//

import Foundation

struct AnalyticsTestBaseTemplate {
    static let value = """
@testable import INSERT_TARGET_NAME
import Foundation
import XCTest
import UIKit

class AnalyticsTestBase {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
        UIPasteboard.general.string = ""
    }

    func extractAnalytics() -> [INSERT_EVENT_STRUCT_NAME] {
        let string = UIPasteboard.general.string!
        if let events = try? decodeMetricEvents(from: string) {
            return events
        } else {
            return []
        }
    }

    private func decodeMetricEvents(from string: String) throws -> [INSERT_EVENT_STRUCT_NAME] {
        guard !string.isEmpty else { return [] }
        let data = Data(string.utf8)

        guard let arrayOfEvents: [NSDictionary] = try JSONSerialization.jsonObject(with: data) as? [NSDictionary] else {
            return []
        }

        return arrayOfEvents.compactMap { INSERT_EVENT_STRUCT_NAME(from: $0) }
    }

    func assertContains(
        name: String,
        count: Int = 1
    ) {
        let records = extractAnalytics()

        XCTAssertEqual(
            records.filter { $0.name == name }.count,
            count,
            "Event with name \u{005C}(name) not found."
        )
    }

    func assertLast(event: INSERT_EVENT_STRUCT_NAME) {

        let records = extractAnalytics()

        XCTAssertEqual(
            records.last?.name,
            event.name,
            "Last event should be \u{005C}(event), but found \u{005C}(records.last.debugDescription)."
        )
    }
}
"""
}
