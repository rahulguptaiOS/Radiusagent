//
//  FacilityViewModel.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//

import Foundation

class FacilityViewModel: ObservableObject {
    @Published var facilityContainer: FacilitiesContainer?
    @Published var error: Error?

    func getFacilitiesContainer() {
        NetworkManager.shared.getFacilities { [weak self] facilitiesContainer, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.facilityContainer = facilitiesContainer
                self.error = error
            }
        }
    }

    func updateOption(facilityId: String?, optionId: String?) {
        facilityContainer?.updateOption(for: facilityId, optionId: optionId)
    }

    func isOptionDisable(facilityId: String?, optionId: String?) -> Bool {
        return facilityContainer?.isOptionDisable(facilityId: facilityId, optionId: optionId) ?? false
    }

    func isOptionSelected(facilityId: String, optionId: String?) -> Bool {
        return facilityContainer?.selectedFacilityDict[facilityId] == optionId
    }
}
