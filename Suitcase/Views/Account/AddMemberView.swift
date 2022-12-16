//
//  AddMemberView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct AddMemberView: View {
    @ObservedObject var userViewModel = UserViewModel()
    @State var searchText = ""
    
    
        var body: some View {
            NavigationView{
                List($userViewModel.filteredUsers, id: \.id) {$user in
                    NavigationLink(destination: MemberDetailView(user: $user)){
                        MemberRowView(user: $user)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Add Friends")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    .onChange(of: searchText){searchText in
                        if !searchText.isEmpty {
                            userViewModel.filteredUsers = userViewModel.users.filter {
                                $0.name.contains(searchText) }
                        } else {
                            userViewModel.filteredUsers = userViewModel.users
                        }
                    }
            }
            .padding()
        }
}

struct AddMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberView()
    }
}
