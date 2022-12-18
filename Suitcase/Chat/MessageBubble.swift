//
//  MessageBubble.swift
//  Suitcase
//
//  Created by meg on 12/17/22.
//

import SwiftUI

struct MessageBubble: View {
    var message: Chat
        @State private var showTime = false
        var body: some View {
            VStack(alignment: message.received ? .leading : .trailing) {
                HStack{
                    Text(message.messageText)
                        .padding()
                        .background(message.received ? Color("LightTan") : Color("LightBlue"))
                        .cornerRadius(30)
                }
                .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
                if showTime {
                    Text("\(message.sentAt.formatted(.dateTime.hour().minute()))")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(message.received ? .leading : .trailing, 25)
                }
            }
            .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
            .padding(.horizontal, 10)
        }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Chat(id: "12345", messageText: "testing !!", received: true, sentAt: Date(), sentBy: "meg"))
           
    }
}
