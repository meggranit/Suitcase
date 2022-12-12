//
//  ContentView.swift
//  Suitcase
//
//  Created by meg on 11/29/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        
        NavigationView {
            if userViewModel.signedIn {
                MyTripsView()
            }
            else {
                LoginView()
            }
        }
        .onAppear {
            userViewModel.signedIn = userViewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
