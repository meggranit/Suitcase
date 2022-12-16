//
//  SuitcaseApp.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI
import FirebaseCore
import Firebase


@main
struct SuitcaseApp: App {
    @StateObject var locationViewModel = LocationViewModel()
    init() {
        FirebaseApp.configure()

    }
    var body: some Scene {
        WindowGroup {
            let userViewModel = UserViewModel()
            ContentView()
                .environmentObject(userViewModel)
                .environmentObject(locationViewModel)
        }
    }
}


