//
//  FacilitiesContainer.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//


import Foundation

struct FacilitiesContainer: Decodable {
    private enum CodingKeys: String, CodingKey {
        case facilities
        case exclusions
    }

    var facilities: [Facility]
    let exclusions: [[Exclusion]]
    var disabledOptions: [DisabledOption] = []
    var selectedFacilityDict: [String : String] = [:]

    func isOptionDisable(facilityId: String?, optionId: String?) -> Bool {
        let disabledOptions = disabledOptions.filter({ $0.facilityId == facilityId })
        return disabledOptions.contains(where: { disabledOption in
            disabledOption.optionId == optionId
        })
    }

    mutating func updateOption(for facilityId: String?, optionId: String?){
        disabledOptions.removeAll { disabledOption in
            disabledOption.exclusiveFacilityId == facilityId
        }

        if let exclusions = getExclusion(for: facilityId, optionId: optionId) {
            for exclusion in exclusions {
                disabledOptions.append(DisabledOption(exclusiveFacilityId: facilityId, facilityId: exclusion.facilityId, optionId: exclusion.optionsId))
            }
        }
        
        selectedFacilityDict[facilityId ?? ""] = optionId
    }

    private func getExclusion(for facilityId: String?, optionId: String?) -> [Exclusion]? {
        if let index = exclusions.firstIndex(where: { exclusions in
            return exclusions.first {$0.facilityId == facilityId && $0.optionsId == optionId } != nil
        }) {
            return exclusions[index]
        }
        
        return nil
    }
    
}
