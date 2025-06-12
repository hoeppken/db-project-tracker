//
//  db_project_trackerApp.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 12.06.25.
//

import SwiftUI
import SwiftData

@main
struct DBProjectTracker: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self,ProjectUpdate.self])
        }
    }
}
