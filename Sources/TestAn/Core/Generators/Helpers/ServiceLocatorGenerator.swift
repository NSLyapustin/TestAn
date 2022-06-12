//
//  ServiceLocatorGenerator.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

class ServiceLocatorGenerator {
    static func generateLocator(with config: Config) {
        let extensions = AnalyticsServiceLocatorTemplate.value
            .replace(target: "INSERT_PROTOCOL_NAME", withString: config.config.analyticsServiceProtocolName)
            .replace(target: "INSERT_SERVICE_NAME", withString: config.config.analyticsServiceName)
        let fileName = "AnalyticsServiceLocator"

        try? extensions.write(to: URL(fileURLWithPath: "\(config.config.sourceFolderPath)/\(config.config.helpersFolderPath)/\(fileName).swift"), atomically: true, encoding: .utf8)

        ProjectUtils.addFileToTarget(xcodeprojPath: "\(config.config.sourceFolderPath)/\(config.config.xcodeprojName).xcodeproj", filePath: "\(config.config.helpersFolderPath)/\(fileName).swift", targetName: config.config.targetName)
    }
}
