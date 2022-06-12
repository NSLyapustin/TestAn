//
//  GenerateConfig.swift
//  TestAn
//
//  Created by n.lyapustin on 09.06.2022.
//

import ArgumentParser
import Foundation

extension Command {
    struct GenerateTemplate: ParsableCommand {
        static var configuration: CommandConfiguration {
            .init(
                commandName: "generate_config_template",
                abstract: "Command for generating config template"
            )
        }

        func run() throws {
            try? ConfigTemplate.value.write(to: URL(fileURLWithPath: "../testanConfig.json"), atomically: true, encoding: .utf8)
        }
    }
}
