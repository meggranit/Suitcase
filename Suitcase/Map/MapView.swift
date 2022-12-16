//
//  MapView.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import SwiftUI

struct MapView: View {
    @State private var showLocationSearchView = true
    var body: some View {
        ZStack(alignment: .top) {
            MapRepresentable()
                .ignoresSafeArea()
            
            if !showLocationSearchView {
                LocationListView(showLocationSearchView: $showLocationSearchView)
            } else {
                LocationSearchView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                        }
                    }
            }
            MapButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
