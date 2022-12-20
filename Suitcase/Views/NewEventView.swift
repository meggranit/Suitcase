//
//  NewEventView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct NewEventView: View {
    @ObservedObject var planListViewModel: PlanListViewModel
    
    @State var name: String = ""
    @State var description: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var userID = UserModel.shared.currentUserRef
    
    let newPlanVM = NewPlanViewModel()
    var trip: Trip
    
    init(trip: Trip){
        self.trip = trip
        planListViewModel = PlanListViewModel(selectedTrip: trip.documentID!)
    }
    
    
    var body: some View {
        VStack{
            Text("New Plan")
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundColor(Color(red: 0.478, green: 0.4392156862745098, blue: 0.403921568627451))
                .padding(.bottom, 40.0)
                .padding(.top, 100)
            TextField(
                    "name",
                    text: $name
            )
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 20.0)
            TextField(
                    "description",
                    text: $description
            )
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 25.0)
            DatePicker(
                    "Start Date",
                    selection: $startDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
            .padding(.horizontal, 50.0)
            DatePicker(
                    "End Date",
                    selection: $endDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
            .padding(.horizontal, 50.0)
            .padding(.bottom, 40.0)
            Button(action: { newPlanVM.addPlan(id: UUID().uuidString, eventName: name, eventDescription: description, addedBy:"\(userID)", startDate: startDate.formatted(), endDate: endDate.formatted(), selectedTrip: trip.documentID!)  }) {
                Text("add")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
            .cornerRadius(15)
            .padding(.bottom, 15.0)
            Spacer()
        }
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventView(trip: Trip(id: "13", tripName: "name", longitude: "123", latitude: "123", startDate: "1234", endDate: "123"))
    }
}
