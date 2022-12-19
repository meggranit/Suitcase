//
//  SelectedTripLocationSearchView.swift
//  Suitcase
//
//  Created by meg on 12/18/22.
//

import SwiftUI

struct SelectedTripLocationSearchView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @Binding var trip: Trip
    
    var body: some View {
        HStack {
            Text("\(trip.tripName)")
                    .foregroundColor(Color(.darkGray))
                    .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .shadow(color: .black, radius: 6)
        )
    }
}

struct SelectedTripLocationSearchView_Previews: PreviewProvider {
    @State static var customBinding = Trip(id: "12345", tripName: "Summer!", longitude: "21.0", latitude: "-43.1", startDate: Date().formatted(), endDate: Date().formatted())
    static var previews: some View {
        SelectedTripLocationSearchView(trip: $customBinding)
    }
}
