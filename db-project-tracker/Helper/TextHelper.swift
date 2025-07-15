//
//  TextHelper.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 15.07.25.
//

import Foundation

struct TextHelper {
    
    static func convertStat (input: Double) -> String {
        switch (input) {
        case let stat where input > 1000:
            // Divide by 1000, replace with "k"
            let divideStat = stat / 1000
            // ex: 2.324 * 10
            // round(23.24)
            // 23/10
            // 2.3 >>> add the "k"
            return "\(round(divideStat * 10)/10)k"
        default:
            return String(Int(input))
        }
    }
    
    static func limitChars (input: String, limit: Int) -> String {
        // if the input is above the limit, take the first limit numbers of characters 
        if input.count > limit {
            return String(input.prefix(limit))
        }
        return input
    }
    
}
