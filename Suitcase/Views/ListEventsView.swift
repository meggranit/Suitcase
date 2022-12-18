//
//  ListEventsView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct ListEventsView: View {

    @State var tripID: String?
    
    //@ObservedObject var planListVM = PlanListViewModel()
    @State var searchText = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("List plans ")
        Text("\(tripID!)")
        VStack {
            NavigationLink(destination: NewEventView()) {
                Text("Add")
                
            }
            NavigationView {
                /*
                List($planListVM.filteredPlans, id: \.id) {$plan in
                    NavigationLink(destination: {}) {
                    PlansRowView(plan: $plan)
                }
                 */
               Text("plan")
            }
            .listStyle(.plain)
            .navigationTitle("My Plans")
            .navigationBarHidden(false)
            
            .onChange(of: searchText) { searchText in
                /*
                if !searchText.isEmpty {
                    planListVM.filteredPlans = planListVM.plans.filter { $0.eventName.contains(searchText) }
                    } else {
                        planListVM.filteredPlans = planListVM.plans
                    }
                */
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                Button(action: { self.presentationMode.wrappedValue.dismiss() } ) {
                    Text("Logout")
                }

            }
           
        }
     
        
    
         
    
}

struct ListEventsView_Previews: PreviewProvider {
    @State static var customBinding = Plan(id: "12", eventName: "name", eventDescription: "description", addedBy: "userID", startDate: "123", endDate: "123")
    static var previews: some View {
        ListEventsView(tripID: "$customBinding.id")
    }
}
