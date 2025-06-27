//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 23.06.25.
//

import SwiftUI

struct EditUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    @State private var showConfirmation = false
    var project : Project
    var update : ProjectUpdate
    var isEditmode : Bool
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                
                Text(isEditmode ? "Edit update" : "New update")
                    .font(.bigHeadline)
                    .foregroundColor(.white)
                
                    
                    TextField("Headline", text: $headline)
                        
                    
                TextField("Summary", text: $summary, axis: .vertical)
                        
                    
                HStack {
                    
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad).frame(width: 60)
                        
                    
                    Button {
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        if !isEditmode {
                            //add project update
                            project.updates.insert(update, at: 0)
                        }

                        dismiss()
                        
                    } label: {
                        Text (isEditmode ? "Save" : "Add")
                    }.buttonStyle(.borderedProminent)
                    
                    if isEditmode {
                        Button("Delete") {
                            //Show confirmation dialog
                            showConfirmation = true
                        }.buttonStyle(.borderedProminent)
                            .tint(.red)
                    }

                }
                Spacer()
                
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
                .padding(.top)
            
            
        }
        .confirmationDialog("Delete update?", isPresented: $showConfirmation) {
            Button("Yes, delete") {
                //Remove all updates from project with same id
                project.updates.removeAll { u in u.id == update.id}
                dismiss()
            }
            
        }
        
    }
}


