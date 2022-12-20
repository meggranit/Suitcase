//
//  MemberDetailView.swift
//  Suitcase
//
//  Created by meg on 12/14/22.
//

import SwiftUI

struct MemberDetailView: View {
    
    @ObservedObject var mdvm: MemberDetailViewModel
    var user: User
    var trip: Trip
    let newMemberVM = NewMemberViewModel()
    
    init(user: User, trip: Trip){
        self.user = user
        self.trip = trip
        mdvm = MemberDetailViewModel(selectedTrip: trip.documentID!)
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Text(user.name)
            Text(user.email)
            Button(action: {
                newMemberVM.addMember(user: user, selectedTrip: trip.documentID!)
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Add to trip")
            }
        }
    }
}

struct MemberDetailView_Previews:
    PreviewProvider {
@State static var customBinding = User(id: "123", name: "name", email: "name@email")
        static var previews: some View {
            MemberDetailView(user: customBinding, trip: Trip(id: "123", tripName: "name", longitude: "123", latitude: "123", startDate: "123", endDate: "123"))
        }
}
