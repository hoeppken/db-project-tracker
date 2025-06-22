//
//  ProjectUpdateView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 22.06.25.
//

import SwiftUI

struct ProjectUpdateView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0, y: 4)
            
            VStack (alignment:.leading, spacing: 10){
                HStack {
                    Text("Thursday, September 12, 2025").padding(.leading)
                    Spacer()
                    Text("9 Hours").padding(.trailing)
                }
                .padding(.vertical ,5)
                .background(Color("Orchid"))
                Text("Project Headline").font(.smallHeadline).padding(.horizontal)
                Text("That sounds like a super fun and meaningful app concept, Raphael! Before I generate the logo, could you please upload a photo of yourself (optional), just in case you’d like to be subtly represented in the logo illustration—or we can skip that and focus entirely on the visual identity.")
                    .padding(.horizontal)
                    .padding(.bottom)
                
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectUpdateView()
}
