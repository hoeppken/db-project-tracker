//
//  AddProjectView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 21.06.25.
//

import SwiftUI
import SwiftData

struct AddProjectView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State var projectName: String = ""
    var project : Project
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                
                Text("New Project")
                    .font(.bigHeadline)
                    .foregroundColor(.white)
                HStack {
                    
                    TextField("Project Name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        //add project to swift data
                        project.name = projectName
                        context.insert(project)
                        
                        dismiss()
                        
                    } label: {
                        Text ("Add")
                    }.buttonStyle(.borderedProminent)

                        
                    
                }
                Spacer()
                
            }.padding(.horizontal)
                .padding(.top)
            
            
        }
        
    }
}

#Preview {
    AddProjectView(projectName: "Test project", project: Project())
}
