//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Михаил Зверьков on 15.02.2022.
//

import SwiftUI

enum currentLight {
    case red
    case yellow
    case green
    case noLight
}

enum lightStatus: Double {
    case lightOn = 1.0
    case lightOff = 0.5
    
}

struct ContentView: View {
    @State private var currentLight: currentLight = .noLight
    @State private var buttonText = "Start"
    @State private var yellowLightOpacity = 1.0
    @State private var redLightOpacity = 1.0
    @State private var greenLightOpacity = 1.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ColorCircle(color: .red, opacity: redLightOpacity)
                ColorCircle(color: .yellow, opacity: yellowLightOpacity)
                ColorCircle(color: .green, opacity: greenLightOpacity)
                Spacer()

                Button(action: changeLight) {
                    Text(buttonText)
                }.buttonStyle(CustomButtonStyle())
            }
        }
    }
    
    private func changeLight() -> Void {
        switch currentLight {
        case .red:
            redLightOpacity = lightStatus.lightOff.rawValue
            yellowLightOpacity = lightStatus.lightOn.rawValue
            currentLight = .yellow
        case .yellow:
            yellowLightOpacity = lightStatus.lightOff.rawValue
            greenLightOpacity = lightStatus.lightOn.rawValue
            currentLight = .green
        case .green:
            greenLightOpacity = lightStatus.lightOff.rawValue
            redLightOpacity = lightStatus.lightOn.rawValue
            currentLight = .red
        case .noLight:
            yellowLightOpacity = lightStatus.lightOff.rawValue
            greenLightOpacity = lightStatus.lightOff.rawValue
            currentLight = .red
            buttonText = "Next"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
