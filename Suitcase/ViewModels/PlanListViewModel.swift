//
//  PlanListViewModel.swift
//  Suitcase
//
//  Created by Meghan Granit on 12/17/22.
//

import Foundation

class PlanListViewModel: ObservableObject {
    
    
    var planModel = PlansModel.shared
    var selectedTrip: String
    
    @Published var plans:[Plan] = []
    @Published var filteredPlans:[Plan] = []
    
    init(selectedTrip: String) {
        self.selectedTrip = selectedTrip
        plans = planModel.plans
        filteredPlans = planModel.plans
        planModel.observeAllPlans(selectedTrip: selectedTrip)
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: Notification.Name(kPlanInfoUpdated), object: nil)
        
    }
    
    @objc
    
    func updateList() {
        plans = planModel.plans
        filteredPlans = planModel.plans
    }
    
}

