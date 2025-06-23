//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 23.06.25.
//

import SwiftUI

struct AddUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    var project : Project
    var update : ProjectUpdate
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                
                Text("New update")
                    .font(.bigHeadline)
                    .foregroundColor(.white)
                
                    
                    TextField("Headline", text: $headline)
                        
                    
                TextField("Summary", text: $summary, axis: .vertical)
                        
                    
                HStack {
                    
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad).frame(width: 60)
                        
                    
                    Button {
                        //save the project update
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.updates.append(update)
                        
                        dismiss()
                        
                    } label: {
                        Text ("Add")
                    }.buttonStyle(.borderedProminent)

                }
                Spacer()
                
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
                .padding(.top)
            
            
        }
        
    }
}

#Preview {
    AddUpdateView(project: Project(), update: ProjectUpdate())
}
