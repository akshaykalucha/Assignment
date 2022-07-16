//
//  Extensions.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//



// extensions for app
import Foundation
import SwiftyJSON
import SwiftUI


// a protocol which can be extended
protocol InforForKey {
    func infoForKey(_ key: String)
}

// view and NSObject can subscribe to same protocol instead of writing function again n again
extension View {
    func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}

public func getDataFrom(JSON json: JSON) -> Data? {
    do {
        return try json.rawData(options: .prettyPrinted)
    } catch _ {
        return nil
    }
}

public func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)?
        .replacingOccurrences(of: "\\", with: "")
}
