//
//  EventExtensionsGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

class EventExtensionsGenerator {
    static func generateExtension(with config: Config) {
        let extensions = EventExtensionsTemplate.value
            .replace(target: "INSERT_EVENT_STRUCT_NAME", withString: config.config.analyticsEventStructure)
        let fileName = "\(config.config.analyticsEventStructure)+Extensions"

        try? extensions.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.helpersFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj", filePath: "\(config.config.helpersFolderPath)/\(fileName).swift", targetName: config.config.targetName)
    }
}
