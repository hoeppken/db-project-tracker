//
//  AddProjectView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 21.06.25.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var projectName: String = ""
    var project : Project
    var isEditmode: Bool
    @State private var showConfirmation : Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                
                Text(isEditmode ? "Edit Project" : "Add Project")
                    .font(.bigHeadline)
                    .foregroundColor(.white)
                HStack {
                    
                    TextField("Project Name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: projectName) { oldValue, newValue in
                            projectName = TextHelper.limitChars(input: projectName, limit: 30)
                        }
                    
                    Button {

                        if isEditmode {
                            //save the new project name
                            project.name = projectName
                            
                        }else {
                            withAnimation{
                                //Add project to swiftdata
                                project.name = projectName
                                context.insert(project)
                                
                                //force a SwiftData save
                                try? context.save()
                            }
                            
                        }
                        dismiss()
                        
                    } label: {
                        Text (isEditmode ? "Save" : "Add")
                    }.buttonStyle(.borderedProminent)
                        .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

                    if isEditmode {
                        //show delete Button
                        Button("Delete") {
                            //show a confirmation dialog
                            showConfirmation = true
                        }.buttonStyle(.borderedProminent).tint(.red)
                    }
                        
                    
                }
                Spacer()
                
            }.padding(.horizontal)
                .padding(.top)
            
            
        }
        .confirmationDialog("Delete project?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete") {
                withAnimation  {
                    context.delete(project)
                    //force a SwiftData save
                    try? context.save()
                }
                dismiss()
            }
        }
        .onAppear {
            projectName = project.name
        }
        
    }
    
}


