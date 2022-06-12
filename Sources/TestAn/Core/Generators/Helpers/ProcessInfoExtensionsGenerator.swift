//
//  ProcessInfoExtensionsGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

class ProcessInfoExtensionsGenerator {
    static func generateExtension(with config: Config) {
        let extensions = ProcessInfoExtensions.value
        let fileName = "ProcessInfoExtension"

        try? extensions.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.helpersFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj", filePath: "\(config.config.helpersFolderPath)/\(fileName).swift", targetName: config.config.targetName)
    }
}
