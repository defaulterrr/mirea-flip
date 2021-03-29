//
//  ContentView.swift
//  mirea-flip
//
//  Created by defaulterrr on 29.03.2021.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        Text("Test")
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            WorkflowView()
                .tabItem {
                    Label("Workflow", systemImage: "pencil.circle" )
                }
            ContentView2()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
