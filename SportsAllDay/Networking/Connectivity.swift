//
//  Connectivity.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/27/21.
//

import Foundation
import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    
}
