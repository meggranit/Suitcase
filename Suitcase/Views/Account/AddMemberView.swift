//
//  AddMemberView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct AddMemberView: View {
    @State private var searchText = ""
        var body: some View {
            NavigationStack {
                Text("Searching for \(searchText)")
                    .navigationTitle("Add Members")
            }
            .searchable(text: $searchText)
        }
}

struct AddMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberView()
    }
}
