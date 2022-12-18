//
//  ContentView.swift
//  Suitcase
//
//  Created by meg on 11/29/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    //@ObservedObject var userViewModel = LoginViewModel()
    //@EnvironmentObject var userViewModel: UserViewModel
    
    
    var body: some View {
        TabView{
            MyTripsView()
                .tabItem {
                    Text("My Trips")
                }
            
            InvitedTripsView()
                .tabItem {
                    Text("Invited")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
