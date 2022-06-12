//
//  Config.swift
//  TestAn
//
//  Created by n.lyapustin on 09.06.2022.
//

import Foundation

struct Config: Decodable {
    let config: ConfigSettings
    let events: [Event]

    struct ConfigSettings: Decodable {
        let analyticsEventStructure: String
        let analyticsServiceProtocolName: String
        let analyticsServiceName: String
        let targetName: String
        let xcodeprojName: String
        let UITestsTargetName: String
        let sourceFolderPath: String
        let helpersFolderPath: String
        let testsFolderPath: String
    }
}
