//
//  ProjectCardView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 20.06.25.
//

import SwiftUI

struct ProjectCardView: View {
    
    
    var body: some View {
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: 15).opacity(0.7).shadow(radius: 10, x: 0, y: 4)
            
            VStack (alignment: .leading, spacing: 10){
                Text ("Project 1")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack (alignment: .center, spacing: 13){
                    Spacer()
                    StatbubbleView(title: "Hours", stat: "290", startColor: Color("Navy"), endColor: Color("Blue"))
                    StatbubbleView(title: "Sessions", stat: "34", startColor: Color("Green"), endColor: Color("Lime"))
                    StatbubbleView(title: "Updates", stat: "32", startColor: Color("Maroon"), endColor: Color("Purple"))
                    StatbubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                    Spacer()
                }
                Text ("my current focus is...").font(.featuredText).foregroundStyle(.gray)
                Text ("Design the new website").font(.featuredText).foregroundStyle(.gray).bold()
            }.padding()

        }
    }
}

#Preview {
    ProjectCardView()
}
