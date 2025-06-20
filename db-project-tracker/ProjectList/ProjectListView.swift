//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 12.06.25.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                Text("Projects")
                    .font(.screenHeading)
                    .foregroundStyle(.white)
                    
                ScrollView(showsIndicators: false){
                    
                    VStack (alignment: .center, spacing: 26){
                        
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        
                    }
                    
                }
                

            }.padding(.horizontal, 20)
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        //Add some code
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
        
    }
}

#Preview {
    ProjectListView()
}
