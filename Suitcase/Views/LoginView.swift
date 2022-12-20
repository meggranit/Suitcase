//
//  LoginView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
 
    
    //@EnvironmentObject var userViewModel: UserViewModel
    @ObservedObject var loginVM = LoginViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.478, green: 0.4392156862745098, blue: 0.403921568627451))
                    .padding(.bottom, 40.0)
                    .padding(.top, 100)
                TextField(
                        "email",
                        text: $email
                )
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 50.0)
                .padding(.bottom, 20.0)
                
                SecureField(
                        "password",
                        text: $password
                )
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 50.0)
                .padding(.bottom, 25.0)
                Button {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    loginVM.loginUser(withEmail: email, password: password)
                    
                } label: {
                    Text("Login")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding(.bottom, 15.0)
                Text("Don't have an account?")
                Text("Click here to register.")
                    .padding(.bottom, 5.0)
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Register")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                
                if (loginVM.loggedIn) {
                    NavigationLink("Main View!", destination: ContentView(), isActive: $loginVM.loggedIn)
                } else {
                    EmptyView()
                }
                
                
                Spacer()

            }
           
        }
        
    }
        
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
