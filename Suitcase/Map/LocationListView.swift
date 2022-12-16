//
//  LocationListView.swift
//  Suitcase
//
//  Created by meg on 12/15/22.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject var viewModel: LocationViewModel
    @Binding var showLocationSearchView: Bool
    var body: some View {
        VStack {
            TextField("Destination", text: $viewModel.queryFragment)
                .frame(height: 32)
                .background(Color(.systemGray3))
                .padding(.horizontal)
                .padding(.top, 64)
            Divider()
                .padding(.vertical)
            ScrollView{
                VStack (alignment: .leading) {
                    ForEach(viewModel.results , id: \.self) { result in
                        LocationSearchCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(result)
                                showLocationSearchView.toggle()
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(showLocationSearchView: .constant(false))
    }
}
