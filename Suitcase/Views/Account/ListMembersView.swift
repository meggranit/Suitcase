//
//  ListMembersView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct ListMembersView: View {
    @StateObject var userStateObject = UserViewModel()
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        VStack {
            NavigationStack{
                VStack{
                    AddMemberView()
                    ScrollView{
                        //ForEach(userStateObject.users, id: \.id) { user in
                           // MemberRowView(user: user)
                        //}
                    }
                }
                .navigationTitle("Friends")
                .toolbar {
                    Button("Logout"){
                        userViewModel.signOut()
                    }
                }
            }
            Spacer()
        }
    }
}

struct ListMembersView_Previews: PreviewProvider {
    static var previews: some View {
        ListMembersView()
    }
}
