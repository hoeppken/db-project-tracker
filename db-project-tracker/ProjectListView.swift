//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Rafael dos Santos Varela on 12.06.25.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.screenHeading)
                .foregroundStyle(Color("Washed Blue"))
            
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
