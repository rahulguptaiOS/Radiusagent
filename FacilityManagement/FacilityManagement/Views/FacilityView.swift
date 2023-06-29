//
//  FacilityView.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//
import SwiftUI

struct FacilityView: View {
    @ObservedObject var facilityViewModel: FacilityViewModel
    @State private var optionId: String = ""
    let facility: Facility

    init(facilityViewModel: FacilityViewModel, facility: Facility) {
        self.facilityViewModel = facilityViewModel
        self.facility = facility
    }

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            Text(self.facility.name)
                .font(Font.system(size: 15))
                .padding(5)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 150, maximum: 200)),
            ]) {
                ForEach(facility.options){ item in
                    CapsuleView(optionId: $optionId,
                                option: item,
                                facilityId: facility.facilityId,
                                isDisable: facilityViewModel.isOptionDisable(facilityId: facility.facilityId, optionId: item.id),
                                isSelected: facilityViewModel.isOptionSelected(facilityId: facility.facilityId,
                                                                               optionId: item.id)
                    )
                    .onChange(of: optionId) { newValue in
                        facilityViewModel.updateOption(facilityId: facility.facilityId, optionId: optionId)
                    }
                }
            }
        }
    }
}

