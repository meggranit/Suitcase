//
//  ListEventsView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct ListEventsView: View {

    @State var tripID: String?
    
    @ObservedObject var planListVM: PlanListViewModel
    @State var searchText = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var trip: Trip
    
    init(trip: Trip){
        self.trip = trip
        planListVM = PlanListViewModel(selectedTrip: trip.documentID!)
    }
    
    var body: some View {
        VStack {
            NavigationLink {
                NewEventView(trip: trip)
            } label: {
                Label("Add Plans", systemImage: "calendar")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
            .cornerRadius(15)
            .padding()
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(planListVM.plans, id: \.id) { plan in
                        PlansRowView(plan: plan, trip: trip)
                    }
                }
                .padding(.top, 10)
                .background(.white)
            }
            
            
            
            
        }
        
    }
    
         
    
}

struct ListEventsView_Previews: PreviewProvider {
    @State static var customBinding = Trip(id: "123", tripName: "name", longitude: "1234", latitude: "1234", startDate: "123", endDate: "123")
    static var previews: some View {
        ListEventsView(trip: customBinding)
    }
}
