//
//  LocationSearchView.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import SwiftUI

struct LocationSearchView: View {
    var body: some View {
        HStack {
            Text("Add Location")
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

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
