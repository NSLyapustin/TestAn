//
//  AnalyticsTestBaseGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 12.06.2022.
//

import Foundation

class AnalyticsTestBaseGenerator {
    static func generateTestBase(with config: Config) {
        let generateString = AnalyticsTestBaseTemplate.value
            .replace(target: "INSERT_TARGET_NAME", withString: config.config.targetName)
            .replace(target: "INSERT_EVENT_STRUCT_NAME", withString: config.config.analyticsEventStructure)
        let fileName = "AnalyticsTestBase"

        try? generateString.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.testsFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(
            xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj",
            filePath: "\(config.config.testsFolderPath)/\(fileName).swift",
            targetName: config.config.UITestsTargetName
        )
    }
}
