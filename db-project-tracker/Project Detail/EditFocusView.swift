//
//  EditFocusView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 24.06.25.
//

import SwiftUI

struct EditFocusView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State var focus: String = ""
    var project : Project
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                
                Text("Edit project focus")
                    .font(.bigHeadline)
                    .foregroundColor(.white)
                HStack {
                    
                    TextField("Focus", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        //add the focus to the project
                        project.focus = focus
                        
                        dismiss()
                        
                    } label: {
                        Text ("Add")
                    }.buttonStyle(.borderedProminent)
                        .disabled(project.focus.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    
                    
                    
                }
                Spacer()
                
            }.padding(.horizontal)
                .padding(.top)
            
            
        }
        
    }
}

#Preview {
    EditFocusView(focus: "", project: Project())
}
