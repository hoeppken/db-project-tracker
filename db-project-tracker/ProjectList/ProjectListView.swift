//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 12.06.25.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @State private var newProject : Project?
    @Query private var projects : [Project]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading){
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    
                    ScrollView(showsIndicators: false){
                        
                        VStack (alignment: .center, spacing: 26){
                            
                            ForEach(projects) { p in
                                
                                NavigationLink {
                                    ProjectDetailView(project: p)
                                } label: {
                                    ProjectCardView(project: p)
                                }.buttonStyle(PlainButtonStyle())

                            }
                            
                        }
                        
                    }
                    
                    
                }.padding(.horizontal, 20)
                
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            //Add new project
                            self.newProject = Project()
                        } label: {
                            ZStack {
                                Circle ()
                                    .frame(width: 65)
                                    .foregroundStyle(.black)
                                Image("cross")
                            }
                        }
                        Spacer()
                    }
                }.padding(.horizontal, 20)
                
            }
            
        }.sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.2), .medium])
        }
        
    }
}

#Preview {
    ProjectListView()
}
