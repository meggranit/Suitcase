//
//  EditEventView.swift
//  Suitcase
//
//  Created by meg on 11/22/22.
//

import SwiftUI

struct EditEventView: View {
    let newPlanVM = NewPlanViewModel()
    @Binding var plan: Plan
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var startDate = ""
    @State private var endDate = ""
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            Text("Event Info")
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundColor(Color(red: 0.478, green: 0.4392156862745098, blue: 0.403921568627451))
                .padding(.bottom, 40.0)
                .padding(.top, 100)
            TextField(
                    "name",
                    text: $plan.eventName
            )
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 20.0)
            TextField(
                    "description",
                    text: $plan.eventDescription
            )
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 25.0)
            
            TextField(
                    "start date",
                    text: $plan.startDate
            )
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 25.0)
            TextField(
                    "end date",
                    text: $plan.endDate
            )
            .textFieldStyle(.roundedBorder)
            .padding(5)
            .padding(.horizontal, 80.0)
            .padding(.bottom, 25.0)
            /*
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Text("update")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            }
            .background(Color(red: 0.4470588235294118, green: 0.5843137254901961, blue: 0.6))
            .cornerRadius(15)
            .padding(.bottom, 15.0)
             */
            Spacer()
        }
    }
}

struct EditEventView_Previews: PreviewProvider {
    @State static var customBinding = Plan(id: "123", eventName: "123", eventDescription: "123", addedBy: "123", startDate: "123", endDate: "123")
    static var previews: some View {
        EditEventView(plan: $customBinding)
    }
}
