//
//  LocationSearchView.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import SwiftUI

struct LocationSearchView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        HStack {
            if locationViewModel.selectedLocationCoordinate?.latitude.formatted() != "" && locationViewModel.selectedLocationCoordinate?.longitude.formatted() != "" {
                Text(locationViewModel.results.first?.title ?? "Add Location")
                    .foregroundColor(Color(.darkGray))
                    .padding(.horizontal, 30)
            }
            else {
                Text("Add Location")
                    .foregroundColor(Color(.darkGray))
                    .padding(.horizontal, 30)
            }
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

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
