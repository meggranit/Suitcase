//
//  NewTripView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct NewTripView: View {
    //@StateObject var tripViewModel = TripViewModel()
    @State private var showLocationSearchView = true
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    @State var name: String
    @State var location: String
    @State var startDate: Date
    @State var endDate: Date
    
    let newTripVM = NewTripViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack{
            VStack{
                /*
                 Text("New Trip")
                 .font(.largeTitle)
                 .fontWeight(.regular)
                 .foregroundColor(Color(red: 0.478, green: 0.4392156862745098, blue: 0.403921568627451))
                 .padding(.bottom, 40.0)
                 .padding(.top, 100)
                 */
                Spacer()
                TextField(
                    "name",
                    text: $name
                )
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .padding(.horizontal, 80.0)
                .padding(.bottom, 20.0)
                
                DatePicker(
                    "Start Date",
                    selection: $startDate,
                    displayedComponents: [.date]
                )
                .padding(.horizontal, 50.0)
                DatePicker(
                    "End Date",
                    selection: $endDate,
                    displayedComponents: [.date]
                )
                .padding(.horizontal, 50.0)
                .padding(.bottom, 40.0)
                
                
                Button(action: {
                    newTripVM.addTrip(id: UUID().uuidString, name: name, longitude: (locationViewModel.selectedLocationCoordinate?.longitude.formatted())!, latitude: (locationViewModel.selectedLocationCoordinate?.latitude.formatted())!, startDate: startDate.formatted(), endDate: endDate.formatted())
                    self.presentationMode.wrappedValue.dismiss()
                    //newTripVM.addTrip(id: UUID().uuidString, name: name, longitude: locationViewModel.selectedLocationCoordinate?.longitude, latitude: locationViewModel.selectedLocationCoordinate?.latitude, startDate: startDate, endDate: endDate)
                }) {
                    Text("add")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding(.bottom, 15.0)
                
                Spacer()
            }
            
            
            if !showLocationSearchView {
                LocationListView(showLocationSearchView: $showLocationSearchView)
            } else {
                VStack{
                    ZStack{
                        MapRepresentable()
                            .frame(height: 180)
                        LocationSearchView()
                            .padding(.top, 72)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showLocationSearchView.toggle()
                                }
                            }
                            .padding(.top, 50)
                        
                    }
                    Spacer()
                }
            }
            
            VStack{
                MapButton(showLocationSearchView: $showLocationSearchView)
                    .padding(.leading)
                    .padding(.top, 4)
                Spacer()
            }
            
            
        }
        
    }
}

struct NewTripView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripView(name: "", location: "", startDate: Date(), endDate: Date())
    }
}
