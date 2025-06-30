//
//  StatHelper.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 30.06.25.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    // this method should be run AFTER the new update has been added to project´s updates array
    static func updateAdded (project: Project, update : ProjectUpdate) {
        //Change hours , change wins and change sessions
        project.hours += update.hours
        if update.updateType == .milestone {
            project.wins += 1
        }
        let sortedUpdates = project.updates.sorted { u1, u2 in
            u1.date > u2.date
        }
        if sortedUpdates.count >= 2 {
            // check if the latest 2 updates have the same date
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            if !Calendar.current.isDate(date1, equalTo: date2, toGranularity: .day) {
                //if not the same day , than that means latest update is first of today
                project.sessions += 1
            }
        }else {
            //since there are less than 2 updates, then this is the first of the day
            project.sessions += 1
        }
        
    }
    static func updateDeleted (project: Project, update : ProjectUpdate) {
        
    }
    static func updateEdited (project: Project, hoursDifference : Int) {
        
    }
    
}
