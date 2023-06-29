//
//  Facility.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//

import Foundation

struct Facility: Decodable, Identifiable {
    private enum CodingKeys: String, CodingKey {
        case facilityId
        case name
        case options
    }

    var id = UUID()
    let facilityId: String
    let name: String
    var options: [Option] = []
    var selectedOptionId: String = ""

    mutating func updateOption(optionId: String){
        selectedOptionId = optionId
    }
}
