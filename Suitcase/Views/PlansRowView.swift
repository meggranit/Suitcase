//
//  PlansRowView.swift
//  Suitcase
//
//  Created by meg on 12/6/22.
//

import SwiftUI

struct PlansRowView: View {
    @Binding var plan: Plan
    let userModel = UserModel.shared
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text(plan.eventName)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            HStack{
                Text(plan.startDate)
                Text(" - ")
                Text(plan.endDate)
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal, 20.0)
        }
    }
}

struct PlansRowView_Previews: PreviewProvider {
   @State static var customBinding = Plan(id: "123", eventName: "123", eventDescription: "123", addedBy: "123", startDate: "23", endDate: "123")
    static var previews: some View {
        PlansRowView(plan: $customBinding)
    }
}
