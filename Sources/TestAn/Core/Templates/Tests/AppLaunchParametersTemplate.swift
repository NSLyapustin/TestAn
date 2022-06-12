//
//  AppLaunchParametersTemplate.swift
//  TestAn
//
//  Created by n.lyapustin on 12.06.2022.
//

import Foundation

struct AppLaunchParametersTemplate {
    static let value = """
struct AppLaunchParameters {

    private let sendMetricsToPasteboard: Bool

    init(sendMetricsToPasteboard: Bool = false) {
        self.sendMetricsToPasteboard = sendMetricsToPasteboard
    }

    var launchArguments: [String] {
        var arguments = ["--UI-TESTING"]
        if sendMetricsToPasteboard {
            arguments.append("--SEND-METRICS-TO-PASTEBOARD")
        }
        return arguments
    }
}
"""
}
