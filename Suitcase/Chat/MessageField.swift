//
//  MessageField.swift
//  Suitcase
//
//  Created by meg on 12/17/22.
//

import SwiftUI

struct MessageField: View {
    @ObservedObject var chatViewModel: ChatViewModel
       @State  var message = ""
    let newMessageVM = NewMessageViewModel()
    var trip: Trip
    
    init(trip: Trip){
        self.trip = trip
        chatViewModel = ChatViewModel(selectedTrip: trip.documentID!)
    }
       var body: some View {
           HStack{
               CustomTextField(placeholder: Text("Enter your message here"), text: $message)
               Button{
                   newMessageVM.addMessage(id: UUID().uuidString, messageText: message, sentAt: Date().formatted(), selectedTrip: trip.documentID!)
                   //chatViewModel.sendMessage(text: message)
                   message = ""
               } label : {
                   Image(systemName: "paperplane.fill")
                       .foregroundColor(.white)
                       .padding(10)
                       .background(Color("Teal"))
                       .cornerRadius(50)
               }
           }
           .padding(.horizontal)
           .padding(.vertical, 10)
           .background(Color("LightTan"))
           .cornerRadius(50)
           .padding()
       }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField(trip: Trip(id: "123", tripName: "name", longitude: "13", latitude: "12", startDate: "123", endDate: "123"))
            
    }
}
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
