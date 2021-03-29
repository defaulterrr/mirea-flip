//
//  LoginView.swift
//  mirea-flip
//
//  Created by defaulterrr on 29.03.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State var email: String = "test@gmail.com"
    @State var password: String = "123"
    @EnvironmentObject var authmodel: AuthModel
    
    func loginCallback () {
        authmodel.fetchLogin(self.email, self.password)
    }
    
    var body: some View {
        VStack {
            Section {
                HStack {
                    Spacer()
                    TextField("email", text: $email).disableAutocorrection(true).frame(width: 350, height: 40, alignment: .leading)
                        .font(.custom("Email", size: 20)).autocapitalization(.none)
                    Spacer()
                }
                HStack {
                    Spacer()
                    SecureField("password", text: $password).disableAutocorrection(true).frame(width: 350, height: 40, alignment: .leading)
                        .font(.custom("Password", size: 20)).autocapitalization(.none)
                    Spacer()
                }
            }
            Section {
                Button("Login") {
                    #if DEBUG
                    print("Called login")
                    #endif
                    self.loginCallback()
                }.frame(width: 150, height: 40, alignment: .leading)
                .background(Color.black)
                .foregroundColor(Color.white)
                .font(.custom("Button", fixedSize: 22))
                .padding(5)
                
                Button("Register") {
                    #if DEBUG
                    print("Called register")
                    #endif
                    
                }.frame(width: 150, height: 40, alignment: .leading)
                .background(Color.black)
                .foregroundColor(Color.white)
                .font(.custom("Button", fixedSize: 22))
                .padding(5)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        LoginView()
    }
}

class AuthModel: ObservableObject {
    private let authService = AuthService()
    
    @Published var JWT: String? = nil
    
    var cancellable: AnyCancellable?
    
    func fetchLogin(_ email: String, _ password: String) {
        cancellable = authService.fetchLogin(email, password).sink(receiveCompletion: {_ in }, receiveValue: {
            ResponseContainer in
            self.JWT = ResponseContainer.token
        })
    }
}
