//
//  ProjectCardView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 20.06.25.
//

import SwiftUI

struct ProjectCardView: View {
    
    var project : Project
    
    var body: some View {
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: 15).opacity(0.7).shadow(radius: 10, x: 0, y: 4)
            
            VStack (alignment: .leading, spacing: 10){
                Text (project.name)
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack (alignment: .center, spacing: 13){
                    Spacer()
                    StatbubbleView(title: "Hours", stat: String(project.hours), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    StatbubbleView(title: "Sessions", stat: String(project.sessions), startColor: Color("Turtle Green"), endColor: Color("Lime"))
                    StatbubbleView(title: "Updates", stat: String(project.updates.count), startColor: Color("Maroon"), endColor: Color("Fuschia"))
                    StatbubbleView(title: "Wins", stat: String(project.wins), startColor: Color("Maroon"), endColor: Color("Olive"))
                    Spacer()
                }
                if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                    Text ("my current focus is...").font(.featuredText).foregroundStyle(.gray)
                    Text (project.focus).font(.featuredText).foregroundStyle(.gray).bold()
                }
            }.padding()

        }
    }
}

#Preview {
    ProjectCardView(project: Project())
}
