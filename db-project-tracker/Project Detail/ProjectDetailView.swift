//
//  ProjectDetailView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 21.06.25.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    
    var body: some View {
        
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden(true)
            Button {
                //Navigate back
                dismiss()
            } label: {
                Text("Back")
            }

        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
