//
//  RegisterView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Register")
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundColor(Color(red: 0.478, green: 0.4392156862745098, blue: 0.403921568627451))
                .padding(.bottom, 40.0)
                .padding(.top, 100)
            TextField(
                    "name",
                    text: $name
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 20.0)
            
            TextField(
                    "email",
                    text: $email
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 20.0)
            
            SecureField(
                    "password",
                    text: $password
            )
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 25.0)
            Button {
                guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
                    return
                }
                viewModel.signUp(name: name, email: email, password: password)
            } label: {
                Text("Register")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
            .cornerRadius(15)
            .padding()
        
            
            Spacer()
        }
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
