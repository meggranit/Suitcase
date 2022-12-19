//
//  MemberDetailView.swift
//  Suitcase
//
//  Created by meg on 12/14/22.
//

import SwiftUI

struct MemberDetailView: View {
    
    @StateObject var mdvm = MemberDetailViewModel()
    @Binding var user: User
    
    
    var body: some View {
        VStack {
            Text(user.name)
            Text(user.email)
            Button(action: {return}) {
                Text("Add to trip")
            }
        }
    }
}

struct MemberDetailView_Previews:
    PreviewProvider {
@State static var customBinding = User(id: "123", name: "name", email: "name@email")
        static var previews: some View {
            MemberDetailView(user: $customBinding)
        }
}
