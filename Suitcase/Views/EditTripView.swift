//
//  EditTripView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct EditTripView: View {
    @StateObject var tdvm = TripDetailViewModel()
    @Binding var trip: Trip
    @State private var name: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var startDate = ""
    @State private var endDate = ""
    
   
    var body: some View {
        
        ZStack {
            VStack{
                Text("Edit Trip")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.478, green: 0.4392156862745098, blue: 0.403921568627451))
                    .padding(.bottom, 40.0)
                    .padding(.top, 100)
                TextField(
                    "name",
                        text: $trip.tripName
                )
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 80.0)
                .padding(.bottom, 20.0)
                TextField(
                        "longitude",
                        text: $trip.longitude
                )
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 80.0)
                .padding(.bottom, 25.0)
                TextField(
                        "latitude",
                        text: $trip.latitude
                )
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 80.0)
                .padding(.bottom, 25.0)
                TextField(
                        "start date",
                        text: $trip.startDate
                )
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 80.0)
                .padding(.bottom, 25.0)
                TextField(
                        "end date",
                        text: $trip.endDate
                )
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 80.0)
                .padding(.bottom, 25.0)
                /*
                DatePicker(
                        "Start Date",
                        selection: DateFormatter().date(from: self.trip.startDate) ,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                .padding(.horizontal, 50.0)
                DatePicker(
                        "End Date",
                        selection: $trip.endDate,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                .padding(.horizontal, 50.0)
                .padding(.bottom, 40.0)
                 */
                Button(action: { return }) {
                    Text("update")
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
        MapRepresentable()
    }
}

struct EditTripView_Previews: PreviewProvider {
    @State static var customBinding = Trip(id: "1234", tripName: "Summer!", longitude: "21.0", latitude: "-43.1", startDate: Date().formatted(), endDate: Date().formatted())
    static var previews: some View {
        EditTripView(trip: $customBinding)
    }
}
