//
//  CapsuleView.swift
//  FacilityManagement
//
//  Created by CEPL on 29/06/23.
//
import SwiftUI



struct CapsuleView: View {
    @Binding var optionId: String
    var option: Option
    var facilityId: String
    var isDisable: Bool
    var isSelected: Bool

    var body: some View {
        return Button {
            if isDisable == false {
                optionId = option.id
            }
        } label: {
            HStack{
                Image(option.icon)
                    .padding(4)
                    .frame(height: 20)
                    .aspectRatio(contentMode: .fit)
                    .opacity(isDisable ? 0.5 : 1)

                Text(option.name)
                    .font(Font.system(size: 12))
            }
            .padding(10)
        }
        .buttonStyle(PlainButtonStyle())
        .background(isSelected ? .black : .white)
        .foregroundStyle(isSelected ? .white :
                            isDisable ? .black.opacity(0.5) : .black)
        .overlay(Capsule()
                 .stroke(Color.gray, lineWidth: 1)
                 )
        .clipShape(Capsule())
    }
}
