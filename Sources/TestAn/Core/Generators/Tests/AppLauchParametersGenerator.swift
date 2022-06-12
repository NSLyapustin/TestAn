//
//  AppLaunchParametersGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 12.06.2022.
//

import Foundation

class AppLaunchParametersGenerator {
    static func generateExtensions(with config: Config) {
        let extensions = AppLaunchParametersTemplate.value
        let fileName = "AppLaunchParameters"

        try? extensions.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.testsFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(
            xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj",
            filePath: "\(config.config.testsFolderPath)/\(fileName).swift",
            targetName: config.config.UITestsTargetName
        )
    }
}
