//
//  PlansRowView.swift
//  Suitcase
//
//  Created by meg on 12/6/22.
//

import SwiftUI

struct PlansRowView: View {
    var plan: Plan
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
    static var previews: some View {
        PlansRowView(plan: Plan(id: "1234", eventName: "Dinner", eventDescription: "celebrating the holiday", addedBy: "user2", startDate: "", endDate: ""))
    }
}
