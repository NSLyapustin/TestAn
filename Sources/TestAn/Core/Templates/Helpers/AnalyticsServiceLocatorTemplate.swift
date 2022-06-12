//
//  AnalyticsServiceLocatorTemplate.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

struct AnalyticsServiceLocatorTemplate {
    static let value = """
import UIKit

final class AnalyticsServiceLocator {

    static let shared = AnalyticsServiceLocator()

    private(set) lazy var analyticsService: INSERT_PROTOCOL_NAME = {
        if ProcessInfo.processInfo.isUITesting {
            return PasteboardAnalyticsService()
        } else {
            return INSERT_SERVICE_NAME()
        }
    }()
}
"""
}
