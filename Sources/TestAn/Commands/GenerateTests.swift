//
//  GenerateTests.swift
//  TestAn
//
//  Created by n.lyapustin on 04.06.2022.
//

import Foundation
import ArgumentParser
import XcodeProjectCore

extension Command {
    struct GenerateTests: ParsableCommand {
        static var configuration: CommandConfiguration {
            .init(
                commandName: "generate_tests",
                abstract: "Command for generating test"
            )
        }

        @Argument(help: "filepath")
        var filepath: String

        func run() throws {
            let reader = ConfigReader(filePath: filepath)
            let config = reader.read()

            try? FileManager.default.createDirectory(atPath: "\(config.config.sourceFolderPath)/\(config.config.helpersFolderPath)", withIntermediateDirectories: true, attributes: nil)
            try? FileManager.default.createDirectory(atPath: "\(config.config.sourceFolderPath)/\(config.config.testsFolderPath)", withIntermediateDirectories: true, attributes: nil)

            EventExtensionsGenerator.generateExtension(with: config)
            PasteboardMockGenerator.generate(with: config)
            ProcessInfoExtensionsGenerator.generateExtension(with: config)
            ServiceLocatorGenerator.generateLocator(with: config)
            AnalyticsTestBaseGenerator.generateTestBase(with: config)
            AppLaunchParametersGenerator.generateExtensions(with: config)
            TestsGenerator.generateTests(with: config)
        }
    }
}
