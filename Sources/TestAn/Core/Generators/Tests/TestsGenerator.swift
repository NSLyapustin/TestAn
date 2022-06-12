//
//  TestsGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 12.06.2022.
//

import Foundation

class TestsGenerator {
    static func generateTests(with config: Config) {
        let fileName = "AnalyticsTests"
        var generatedTests = TestsTemplate.header

        for event in config.events {
            generatedTests = generatedTests + TestsTemplate.test.replace(target: "INSERT_EVENT_NAME", withString: event.name)
        }

        generatedTests = generatedTests + TestsTemplate.footer

        try? generatedTests.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.testsFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(
            xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj",
            filePath: "\(config.config.testsFolderPath)/\(fileName).swift",
            targetName: config.config.UITestsTargetName
        )
    }
}
