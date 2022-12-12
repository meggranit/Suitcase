//
//  TripRowView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct TripRowView: View {
    //@State var thisTrip: Trip
    var trip: Trip
    var body: some View {
        VStack{
            HStack{
                Text(trip.tripName)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            HStack{
                Text("\(trip.startDate.formatted(.dateTime.hour().minute()))")
                Text(" - ")
                Text("\(trip.endDate.formatted(.dateTime.hour().minute()))")
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal, 20.0)
           
        }
        
    }
    
}

struct TripRowView_Previews: PreviewProvider {
    static var previews: some View {
        TripRowView(trip: Trip(id: "12345", tripName: "Spring Break", location: "Boston", startDate: Date(), endDate: Date()))
        //TripRowView(thisTrip: Trip(id: "1234", name: ""))
    }
}
