//
//  EditTripView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct EditTripView: View {
    @State private var name: String = ""
    @State private var location: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        VStack{
            Text("Edit Trip")
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
                    "location",
                    text: $location
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
}

struct EditTripView_Previews: PreviewProvider {
    static var previews: some View {
        EditTripView()
    }
}
