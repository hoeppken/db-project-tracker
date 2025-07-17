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
    @State private var selectedProject : Project?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading){
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    
                    if projects.count > 0 {
                        
                        ScrollView(showsIndicators: false){
                            
                            VStack (alignment: .center, spacing: 26){
                                
                                ForEach(projects) { p in
                                    //ProjectCard is what is beeing animated, that explains the insertion of the transition here
                                    ProjectCardView(project: p)
                                        .transition(.scale)
                                        .onTapGesture {
                                            selectedProject = p
                                        }
                                        .onLongPressGesture {
                                            newProject = p }
                                    
                                    
                                    /*
                                     NavigationLink {
                                     ProjectDetailView(project: p)
                                     } label: {
                                     ProjectCardView(project: p)
                                     .onLongPressGesture {
                                     newProject = p
                                     }
                                     }.buttonStyle(PlainButtonStyle())
                                     */
                                }
                                
                            }
                            
                        }
                    }else {
                        //no projects
                        Spacer()
                        HStack {
                            Spacer()
                            Button("Tap to add a new project") {
                                newProject = Project()
                            }
                            .buttonStyle(.bordered)
                            .foregroundStyle(.white)
                            Spacer()
                        }
                        Spacer()
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
            .navigationDestination(item: $selectedProject ) { project in
                ProjectDetailView(project: project)
            }
            
        }.sheet(item: $newProject) { project in
            
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditProjectView(project: project, isEditmode: isEdit)
                .presentationDetents([.fraction(0.2), .medium])
        }
        
    }
}

#Preview {
    ProjectListView()
}
