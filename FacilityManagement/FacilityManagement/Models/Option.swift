//
//  Option.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//
import Foundation

struct Option: Decodable, Identifiable {
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case icon
    }

    let name: String
    let id: String
    let icon: String
}

struct DisabledOption {
    var exclusiveFacilityId: String?
    var facilityId: String?
    var optionId: String?
}
