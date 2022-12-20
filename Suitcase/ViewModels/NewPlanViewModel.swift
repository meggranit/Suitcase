//
//  NewPlanViewModel.swift
//  Suitcase
//
//  Created by Meghan Granit on 12/17/22.
//

import Foundation

class NewPlanViewModel {
    let planModel = PlansModel.shared
    
    func addPlan(id: String, eventName: String, eventDescription: String, addedBy: String, startDate: String, endDate: String, selectedTrip: String){
        let plan = Plan(id: id, eventName: eventName, eventDescription: eventDescription, addedBy: addedBy, startDate: startDate, endDate: endDate)
        planModel.addPlan(plan: plan, docID: selectedTrip)
    }
    
    func findPlan(search: String) -> Plan? {
        return nil
    }
    
    func updatePlan(plan: Plan) {
        print("updateVM")
        planModel.updatePlan(plan: plan)
    }
}

