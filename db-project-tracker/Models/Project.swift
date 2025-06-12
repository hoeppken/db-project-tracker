//
//  Project.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 12.06.25.
//

import Foundation
import SwiftData

@Model

class Project {
    
    @Attribute(.unique) var  id: String
    var name = ""
    var startDate = Date()
    var focus = ""
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var update : [ProjectUpdate] = [ProjectUpdate]()
    
    init() {
        id = UUID().uuidString
    }
    
    
    
}
