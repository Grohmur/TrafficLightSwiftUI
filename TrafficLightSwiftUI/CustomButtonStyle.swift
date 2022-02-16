//
//  CustomButtonStyle.swift
//  TrafficLightSwiftUI
//
//  Created by Михаил Зверьков on 16.02.2022.
//

import SwiftUI


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .cornerRadius(20)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
            .foregroundColor(.white)


    }
}
