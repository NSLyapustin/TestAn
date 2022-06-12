import ArgumentParser
import Foundation

enum Command {}

extension Command {
  struct Main: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "TestAn",
        abstract: "A program to generate UI-tests for analytics layer",
        version: "0.0.1",
        subcommands: [
            Command.GenerateTests.self,
            Command.GenerateTemplate.self
        ]
      )
    }
  }
}

Command.Main.main()
