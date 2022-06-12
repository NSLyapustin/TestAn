//
//  PasteboardMockGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

class PasteboardMockGenerator {
    static func generate(with config: Config) {
        let extensions = PasteboardMockTemplate.value
            .replace(target: "INSERT_EVENT_STRUCT_NAME", withString: config.config.analyticsEventStructure)
            .replace(target: "INSERT_PROTOCOL_NAME", withString: config.config.analyticsServiceProtocolName)
        let fileName = "PasteboardAnalyticsServiceMock"

        try? extensions.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.helpersFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj", filePath: "\(config.config.helpersFolderPath)/\(fileName).swift", targetName: config.config.targetName)
    }
}
