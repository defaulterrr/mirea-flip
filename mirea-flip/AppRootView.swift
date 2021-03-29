//
//  AppRootView.swift
//  mirea-flip
//
//  Created by defaulterrr on 29.03.2021.
//

import SwiftUI
import Combine

struct AppRootView: View {
    @State var isLoggedIn: Bool = false
    @EnvironmentObject var authmodel: AuthModel
    
    var body: some View {
        if authmodel.JWT != nil {
            ContentView()
        } else {
            LoginView()
        }
    }
    
    func login() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
