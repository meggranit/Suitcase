//
//  MemberDetailView.swift
//  Suitcase
//
//  Created by meg on 12/14/22.
//

import SwiftUI

struct MemberDetailView: View {
    @StateObject var userViewModel = UserViewModel()
    @Binding var user: User
    
   
    
    var body: some View {
        VStack {
            
            Text(user.name)
            Text(user.email)
            Button("Add to trip", action: {
                userViewModel.addUserToTrip(user: user)
            })
        }
    }
}

struct MemberDetailView_Previews:
    PreviewProvider {
        @State static var customBinding = User(id: "1234", name: "meg", email: "meg@email.com")
        static var previews: some View {
            MemberDetailView(user: $customBinding)
        }
}
