//
//  SuitcaseApp.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SuitcaseApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //@StateObject var locationViewModel = LocationViewModel()
   
    var body: some Scene {
        WindowGroup {
            //let userViewModel = UserViewModel()
            //NewTripView(name: "", location: "", startDate: Date(), endDate: Date())
            LoginView()
                //.environmentObject(locationViewModel)
        }
    }
}


