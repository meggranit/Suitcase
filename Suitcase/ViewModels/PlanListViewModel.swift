//
//  PlanListViewModel.swift
//  Suitcase
//
//  Created by Meghan Granit on 12/17/22.
//

import Foundation

class PlanListViewModel: ObservableObject {
    
    
    var planModel = PlansModel.shared
    
    @Published var plans:[Plan] = []
    @Published var filteredPlans:[Plan] = []
    
    init() {
        plans = planModel.plans
        filteredPlans = planModel.plans
       planModel.observeAllPlans()
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kPlanInfoUpdated), object: nil)
        
    }
    
    @objc
    
    func updateList() {
        plans = planModel.plans
        filteredPlans = planModel.plans
    }
    
}

