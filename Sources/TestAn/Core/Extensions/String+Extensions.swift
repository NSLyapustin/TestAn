//
//  String+Extensions.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
