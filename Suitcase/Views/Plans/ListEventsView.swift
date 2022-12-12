//
//  ListEventsView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct ListEventsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var plansViewModel = PlansViewModel()
    var body: some View {
        VStack {
            NavigationStack{
                VStack{
                    ScrollView{
                        ForEach(plansViewModel.plans, id: \.id) { plan in
                            PlansRowView(plan: plan)
                        }
                    }
                    NavigationLink {
                        NewEventView()
                    } label: {
                        Label("Add Plans", systemImage: "plus")
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                    .cornerRadius(15)
                    .padding()
                }
                    .navigationTitle("My Plans")
                    .toolbar {
                        Button("Logout"){
                            userViewModel.signOut()
                        }
                        
                    }
            }
            /*
                TripRowView()
                TripRowView()
                TripRowView()
            
            Button(action: { userViewModel.signOut() }) {
                Text("Sign out")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            } */
            Spacer()
            
        }
        // }
    }
    
}

struct ListEventsView_Previews: PreviewProvider {
    static var previews: some View {
        ListEventsView()
    }
}
