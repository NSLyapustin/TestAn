//
//  ProjectUtils.swift
//  TestAn
//
//  Created by n.lyapustin on 11.06.2022.
//

import Foundation
import XcodeProjectCore

class ProjectUtils {
    static func addFileToTarget(xcodeprojPath: String, filePath: String, targetName: String) {
        // Prepare for your project `project.pbxproj` file path.
        let pbxPath = xcodeprojPath + "/project.pbxproj"
        let xcodeprojectFileURL = URL(fileURLWithPath: pbxPath)

        // Instanciate `XcodeProject`.
        let xcodeproject = try? XcodeProject(xcodeprojectURL: xcodeprojectFileURL)
        xcodeproject?.appendFile(path: filePath, targetName: targetName)
        try? xcodeproject?.write()
    }
}
