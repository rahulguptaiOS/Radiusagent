//
//  ContentView.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var facilityViewModel: FacilityViewModel

    init(facilityViewModel: FacilityViewModel = FacilityViewModel()) {
        self.facilityViewModel = facilityViewModel
        facilityViewModel.getFacilitiesContainer()
    }

    var body: some View {
        return VStack{
            if let facilities = facilityViewModel.facilityContainer?.facilities {
                if facilities.isEmpty {
                    Text("No facility available right now")
                } else {
                    List{
                        ForEach(facilities){ item in
                            FacilityView(facilityViewModel: facilityViewModel, facility: item)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
            } else if let error = facilityViewModel.error {
                Text("\(error.localizedDescription)")
            } else {
                ProgressView()
            }
        }
    }

}
