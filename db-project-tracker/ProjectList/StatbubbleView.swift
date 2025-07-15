//
//  StatbubbleView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 20.06.25.
//

import SwiftUI

struct StatbubbleView: View {
    
    var title : String
    var stat : Double
    var startColor : Color
    var endColor : Color
    
    var body: some View {
        HStack (alignment: .center){
            //bubbles
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                VStack {
                    Text (title).font(.captionText)
                    Text (TextHelper.convertStat(input: stat)).font(.featuredNumber)
                }.foregroundStyle(.white)
                
            }.frame(width: 60, height: 40)
        }
    }
}

#Preview {
    StatbubbleView(title: "Hours", stat: 290.0, startColor: .navy, endColor: .washedBlue)
}
