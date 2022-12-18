//
//  AddMemberView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct AddMemberView: View {
   // @ObservedObject userListVM = UserListVM()
    @State var searchText = ""
    
    
    var body: some View {
        Text("List members")
    }
}

struct AddMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberView()
    }
}
