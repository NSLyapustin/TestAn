//
//  EventExtensionsTemplate.swift
//  TestAn
//
//  Created by n.lyapustin on 10.06.2022.
//

import Foundation

struct EventExtensionsTemplate {
    static let value = """
import Foundation

extension INSERT_EVENT_STRUCT_NAME {
    var asJSONObject: NSDictionary {
        return [
            "name": name,
            "values": values ?? [:]
        ]
    }

    public init?(from dict: NSDictionary) {
        guard let eventName = dict["name"] as? String else { return nil }
        self = INSERT_EVENT_STRUCT_NAME(
            name: eventName,
            values: dict["values"] as? [String: AnyHashable]
        )
    }
}
"""
}
