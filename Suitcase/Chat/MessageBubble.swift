//
//  MessageBubble.swift
//  Suitcase
//
//  Created by meg on 12/17/22.
//

import SwiftUI

struct MessageBubble: View {
    var message: Chat
    @ObservedObject var chatViewModel: ChatViewModel
    let userModel = UserModel.shared
    var trip: Trip
    
    init(trip: Trip, message: Chat){
        self.trip = trip
        self.message = message
        chatViewModel = ChatViewModel(selectedTrip: trip.documentID!)
    }

        @State private var showTime = false
        var body: some View {
            VStack(alignment: message.sentBy == userModel.currentUserRef ? .leading : .trailing) {
                HStack{
                    Text(message.messageText)
                        .padding()
                        .background(message.sentBy == userModel.currentUserRef ? Color("LightTan") : Color("LightBlue"))
                        .cornerRadius(30)
                }
                .frame(maxWidth: 300, alignment: message.sentBy == userModel.currentUserRef ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
                if showTime {
                    Text(message.sentAt)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(message.sentBy == userModel.currentUserRef ? .leading : .trailing, 25)
                }
            }
            .frame(maxWidth: .infinity, alignment: message.sentBy == userModel.currentUserRef ? .leading : .trailing)
            .padding(.horizontal, 10)
        }
}

struct MessageBubble_Previews: PreviewProvider {
    @State static var customBinding = Chat(id: "1234", messageText: "text", sentAt: Date().formatted(), sentBy: "user2")
    static var previews: some View {
        MessageBubble(trip: Trip(id: "123", tripName: "name", longitude: "123", latitude: "123", startDate: "123", endDate: "123"), message: customBinding)
           
    }
}
