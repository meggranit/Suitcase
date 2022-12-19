//
//  MessageBubble.swift
//  Suitcase
//
//  Created by meg on 12/17/22.
//

import SwiftUI

struct MessageBubble: View {
    @Binding var message: Chat
    

        @State private var showTime = false
        var body: some View {
            VStack(alignment: message.sentBy == "user1" ? .leading : .trailing) {
                HStack{
                    Text(message.messageText)
                        .padding()
                        .background(message.sentBy == "user1" ? Color("LightTan") : Color("LightBlue"))
                        .cornerRadius(30)
                }
                .frame(maxWidth: 300, alignment: message.sentBy == "user1" ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
                if showTime {
                    Text(message.sentAt)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(message.sentBy == "user1" ? .leading : .trailing, 25)
                }
            }
            .frame(maxWidth: .infinity, alignment: message.sentBy == "user1" ? .leading : .trailing)
            .padding(.horizontal, 10)
        }
}

struct MessageBubble_Previews: PreviewProvider {
    @State static var customBinding = Chat(id: "1234", messageText: "text", sentAt: Date().formatted(), sentBy: "user2")
    static var previews: some View {
        MessageBubble(message: $customBinding)
           
    }
}
