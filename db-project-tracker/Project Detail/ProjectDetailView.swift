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
    @State private var newUpdate : ProjectUpdate?
    @State private var showEditFocus = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color("Navy"),Color ("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color("washedBlue").opacity(0),Color("Sky Blue") ], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading, -150)
                
            
            VStack {
                //Header
                VStack (alignment: .leading, spacing: 13) {
                    Text(project.name)
                        .font(.screenHeading)
                    
                    HStack (alignment: .center, spacing: 13){
                        
                        Spacer()
                        StatbubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor: Color("Sky Blue"))
                        StatbubbleView(title: "Sessions", stat: "34", startColor: Color("Turtle Green"), endColor: Color("Lime"))
                        StatbubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor: Color("Fuschia"))
                        StatbubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                        
                    }
                    
                    Text("My current focus is...")
                        .font(.featuredText)
                    HStack {
                        
                        if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                            
                            Button {
                                //Complete this milestone
                                completeMilestone()
                            } label: {
                                Image(systemName: "checkmark.square")
                            }

                            
                        }
                            
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                //Display the edit focus form
                                showEditFocus = true
                            }
                    }
                    .padding(.leading)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color("Navy")
                    .opacity(0.7)
                    .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15)).ignoresSafeArea())
                
                
                //Project updates
                ScrollView (showsIndicators: false){
                    VStack (spacing: 27){
                       
                        ForEach (project.updates.sorted(by: { u1, u2 in
                            u1.date > u2.date
                        })) { update in
                            
                            ProjectUpdateView(update: update)
                                .onTapGesture {
                                    //just to keep the scrollview working...
                                }
                                .onLongPressGesture {
                                    newUpdate = update
                                }
                            
                        }
                        
                        
                    }
                    .padding()
                    .padding(.bottom, 80)
                    
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        //add project update
                        newUpdate = ProjectUpdate()
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image("cross")
                            
                        }
                    }
                    .padding([.leading, .top])
                    
                    Spacer()
                    Button("Back") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.black)
                    .padding([.trailing, .top])
                    
                }
                .background {
                    Color(.black)
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
            

            
        }.navigationBarBackButtonHidden(true)
            .sheet(item: $newUpdate) { update in
                
                let isEdit = update.headline.trimmingCharacters(in: .whitespacesAndNewlines) != ""
                
                EditUpdateView(project: project, update: update, isEditmode: isEdit)
                    .presentationDetents([.fraction(0.3)])
            }
            .sheet(isPresented: $showEditFocus) {
                EditFocusView(project: project)
                    .presentationDetents([.fraction(0.2)])
            }
    }
    
    func completeMilestone() {
        //Create a new project update for milestone
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone achieved!"
        update.summary = project.focus
        project.updates.insert(update, at: 0)
        
        //Clear the project focus
        project.focus = ""
        
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
