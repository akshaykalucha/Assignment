//
//  Reach.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import Foundation
import SystemConfiguration



// this manager checks your internet connection(WIFI WAN CELLULAR) and if that the API is reachable or not
let ReachabilityStatusChangedNotification = "ReachabilityStatusChangedNotification"


enum ReachabilityType: CustomStringConvertible {
    case wwan
    case wiFi
    
    var description: String {
        switch self {
        case .wwan: return "WWAN"
        case .wiFi: return "WiFi"
        }
    }
}

enum ReachabilityStatus: CustomStringConvertible  {
    case offline
    case online(ReachabilityType)
    case unknown
    
    var description: String {
        switch self {
        case .offline: return "Offline"
        case .online(let type): return "Online (\(type))"
        case .unknown: return "Unknown"
        }
    }
}



public class Reach {
    
    //check if there is internet
    func isInternet() -> Bool {
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            print("Not connected")
            return false
        case .online(.wwan): break
            print("Connected via WWAN")
        case .online(.wiFi): break
            print("Connected via WiFi")
        }
        return true
    }
    
}

