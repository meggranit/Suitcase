//
//  TripRowView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct TripRowView: View {
    @Binding var trip: Trip
    
    //@State var thisTrip: Trip
    //var trip: Trip
    var body: some View {
        VStack{
            HStack{
                Text(trip.tripName)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            HStack{
                //ext("\(trip.startDate.formatted(.dateTime.hour().minute()))")
                Text(" - ")
                //Text("\(trip.endDate.formatted(.dateTime.hour().minute()))")
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal, 20.0)
           
        }
        
    }
    
}

struct TripRowView_Previews: PreviewProvider {
    @State static var customBinding = Trip(id: "12345", tripName: "Spring Break", longitude: "11", latitude: "-42", startDate: Date().formatted(), endDate: Date().formatted())
    static var previews: some View {
        TripRowView(trip: $customBinding)
    }
}
