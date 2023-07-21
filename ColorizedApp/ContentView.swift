//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Даниил Чупин on 21.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = 0.5
    @State private var greenValue: Double = 0.5
    @State private var blueValue: Double = 0.5

    var body: some View {
        VStack {
            ColorPreviewView(redValue: redValue,
                             greenValue: greenValue,
                             blueValue: blueValue)
            
            ColorSlider(value: $redValue,
                        color: .red)
            ColorSlider(value: $greenValue,
                        color: .green)
            ColorSlider(value: $blueValue,
                        color: .blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorPreviewView: View {
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        Color(red: redValue,
              green: greenValue,
              blue: blueValue)
            .frame(height: 200)
            .cornerRadius(10)
            .padding(.bottom, 30)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(colorDescription(for: color)): \(value * 255.0, specifier: "%.0f")")
                .frame(width: 100,
                       alignment: .leading)
            
            Slider(value: $value, in: 0...1, step: 0.01)
                .accentColor(color)
        }
        .padding()
    }
    
    private func colorDescription(for color: Color) -> String {
        switch color {
        case .red: return "Red"
        case .green: return "Green"
        default: return "Blue"
        }
    }
}
