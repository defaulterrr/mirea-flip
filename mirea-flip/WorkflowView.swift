//
//  WorkflowView.swift
//  mirea-flip
//
//  Created by defaulterrr on 29.03.2021.
//

import SwiftUI

struct WorkflowView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(1..<100) {_ in
                        Text("tetsetests")
                    }
                }
            }.navigationBarTitle(Text("Workflow"))
        }
        
    }
}

struct WorkflowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowView()
    }
}
