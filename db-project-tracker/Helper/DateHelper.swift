//
//  DateHelper.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 23.06.25.
//

import Foundation

struct DateHelper {
    
    static func projectUpdateDate(inputDate: Date) -> String {
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: inputDate)
        
    }
}
