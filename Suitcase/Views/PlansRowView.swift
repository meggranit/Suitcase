//
//  PlansRowView.swift
//  Suitcase
//
//  Created by meg on 12/6/22.
//

import SwiftUI

struct PlansRowView: View {
    var plan: Plan
    var trip: Trip
    @ObservedObject var planListVM: PlanListViewModel
    let userModel = UserModel.shared
    
    init(plan: Plan, trip: Trip) {
        self.plan = plan
        self.trip = trip
        planListVM = PlanListViewModel(selectedTrip: trip.documentID!)
        
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(plan.eventName)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            HStack{
                Text(plan.startDate)
                Text(" - ")
                Text(plan.endDate)
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal, 20.0)
        }
    }
}

struct PlansRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlansRowView(plan: Plan(id: "123", eventName: "name", eventDescription: "1234", addedBy: "123", startDate: "123", endDate: "123"), trip: Trip(id: "123", tripName: "123", longitude: "123", latitude: "123", startDate: "123", endDate: "123"))
    }
}
