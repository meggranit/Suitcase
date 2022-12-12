//
//  ChatView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI


struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var typingMessage: String = ""
    

    var body: some View {
        VStack {
            VStack{
                Text("Trip Name")
                    .font(.title)
                    .fontWeight(.light)
                
                ScrollViewReader { proxy in 
                    ScrollView{
                        ForEach(chatViewModel.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                .background(.white)
                .onChange(of: chatViewModel.lastMessageID) { id in withAnimation { proxy.scrollTo(id, anchor: .bottom)}
                }
                }
                //.cornerRadius(30)
               
            }
            .background(Color("LightTan"))
            MessageField()
                .environmentObject(chatViewModel)
        }
    }
      
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
