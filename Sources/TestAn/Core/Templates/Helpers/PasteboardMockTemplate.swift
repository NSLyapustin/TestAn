//
//  PasteboardMockTemplate.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

struct PasteboardMockTemplate {
    static let value = """
import Foundation
import UIKit

final class PasteboardAnalyticsService: INSERT_PROTOCOL_NAME {

    private var analyticsEvents: [INSERT_EVENT_STRUCT_NAME] = []

    func send(event: INSERT_EVENT_STRUCT_NAME) {
        guard ProcessInfo.processInfo.isUITesting,
              ProcessInfo.processInfo.sendMetricsToPasteboard else {
            return
        }

        if UIPasteboard.general.string == nil ||
           UIPasteboard.general.string?.isEmpty == true {
            analyticsEvents = []
        }

        analyticsEvents.append(event)

        if let metricsString = try? encodeMetricEvents(analyticsEvents) {
            UIPasteboard.general.string = metricsString
        }
    }

    private func encodeMetricEvents(_ events: [INSERT_EVENT_STRUCT_NAME]) throws -> String {
        let arrayOfEvents: [NSDictionary] = events.map { $0.asJSONObject }
        let data = try JSONSerialization.data(withJSONObject: arrayOfEvents)
        return String(decoding: data, as: UTF8.self)
    }
}
"""
}
