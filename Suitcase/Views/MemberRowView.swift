//
//  MemberRowView.swift
//  Suitcase
//
//  Created by meg on 12/10/22.
//

import SwiftUI

struct MemberRowView: View {
    
    @Binding var thisUser: User
    
    var body: some View {
        VStack(alignment: .leading){
            Text(thisUser.name)
                .fontWeight(.bold)
            Text(thisUser.email)
        }
    }
}

struct MemberRowView_Previews: PreviewProvider {
    @State static var customBinding = User(id: "123", name: "name", email: "name@email.com")
    static var previews: some View {
        MemberRowView(thisUser: $customBinding)
    }
}
