//
//  MapButton.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import SwiftUI

struct MapButton: View {
    @Binding var showLocationSearchView: Bool
    var body: some View {
        if (!showLocationSearchView){
            Button {
                withAnimation(.spring()) {
                    showLocationSearchView.toggle()
                }
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    } 
}

struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton(showLocationSearchView: .constant(true))
    }
}
