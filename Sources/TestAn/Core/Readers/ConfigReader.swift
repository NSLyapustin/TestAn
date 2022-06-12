//
//  ConfigReader.swift
//  TestAn
//
//  Created by n.lyapustin on 09.06.2022.
//

import Foundation

class ConfigReader {
    let filePath: String

    init(filePath: String) {
        self.filePath = filePath
    }

    func read() -> Config {
        do {
            let content = try String(contentsOfFile: filePath, encoding: .utf8)
            let config = try JSONDecoder().decode(Config.self, from: content.data(using: .utf8)!)
            return config
        } catch {
            fatalError(String(describing: error))
        }
    }
}
