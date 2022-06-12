//
//  ProcessInfoExtensions.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

struct ProcessInfoExtensions {
    static let value = """
import Foundation

extension ProcessInfo {
    var isUITesting: Bool { arguments.contains("--UI-TESTING") }
    var sendMetricsToPasteboard: Bool { arguments.contains("--SEND-METRICS-TO-PASTEBOARD") }
}
"""
}
