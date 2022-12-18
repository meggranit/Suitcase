//
//  SelectedTripView.swift
//  Suitcase
//
//  Created by meg on 12/10/22.
//

import SwiftUI

struct SelectedTripView: View {
    //@EnvironmentObject var userViewModel : UserViewModel
    @State private var showLocationSearchView = true
    //@StateObject var locationViewModel: LocationViewModel
    @StateObject var tdvm = TripDetailViewModel()
    @Binding var trip: Trip
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text(trip.tripName)
                Text(trip.documentID!)
                NavigationLink {
                    ChatView()
                } label: {
                    Label("Chat", systemImage: "message" )
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                NavigationLink {
                    ListEventsView(tripID: trip.documentID)
                } label: {
                    Label("Plans", systemImage: "calendar")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                
                NavigationLink {
                    AddMemberView()
                } label: {
                    Label("Members", systemImage: "person" )
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                
            }
            
            /*
            if !showLocationSearchView {
                LocationListView(showLocationSearchView: $showLocationSearchView)
            } else {
                VStack{
                    ZStack{
                        MapRepresentable()
                            .frame(height: 180)
                        LocationSearchView()
                            .padding(.top, 72)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showLocationSearchView.toggle()
                                }
                            }
                            .padding(.top, 50)
                        
                    }
                    Spacer()
                }
            }
            
            VStack{
                MapButton(showLocationSearchView: $showLocationSearchView)
                    .padding(.leading)
                    .padding(.top, 4)
                Spacer()
            }
            */
        }
    }
}

struct SelectedTripView_Previews: PreviewProvider {
    @State static var customBinding = Trip(id: "12345", tripName: "Summer!", longitude: "21.0", latitude: "-43.1", startDate: Date().formatted(), endDate: Date().formatted())
    static var previews: some View {
        SelectedTripView(trip: $customBinding)
    }
}
