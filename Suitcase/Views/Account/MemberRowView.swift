//
//  MemberRowView.swift
//  Suitcase
//
//  Created by meg on 12/10/22.
//

import SwiftUI

struct MemberRowView: View {
    var user: User
    var body: some View {
        VStack{
            HStack{
                Text(user.name)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            HStack{
                Text("\(user.email)")
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal, 20.0)
           
        }
        
    }
}

struct MemberRowView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRowView(user: User(id: "1234", name: "meg", email: "meg@email.com"))
       
    }
}
