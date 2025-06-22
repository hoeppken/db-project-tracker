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
                        Image(systemName: "checkmark.square")
                            
                        Text("Design the new website")
                            .font(.featuredText)
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
                       
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        ProjectUpdateView()
                        
                        
                    }
                    .padding()
                    .padding(.bottom, 80)
                    
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        //to do
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
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
