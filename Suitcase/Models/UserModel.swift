//
//  UserModel.swift
//  Suitcase
//
//  Created by meg on 12/10/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var name: String
    var email: String
}
