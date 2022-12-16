//
//  SelectedTripView.swift
//  Suitcase
//
//  Created by meg on 12/10/22.
//

import SwiftUI

struct SelectedTripView: View {
    @EnvironmentObject var userViewModel : UserViewModel
    var body: some View {
        NavigationView{
            VStack{
                MapView()
                NavigationLink {
                    ChatView()
                } label: {
                    Label("Chat", systemImage: "message" )
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                NavigationLink {
                    ListEventsView()
                } label: {
                    Label("Plans", systemImage: "calendar")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                
                NavigationLink {
                    AddMemberView()
                } label: {
                    Label("Members", systemImage: "person" )
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                }
                .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
                .cornerRadius(15)
                .padding()
                
            }
        }
    }
}

struct SelectedTripView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTripView()
    }
}
