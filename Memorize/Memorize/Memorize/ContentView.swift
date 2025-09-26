//
//  ContentView.swift
//  Memorize
//
//  Created by Alexandra Titus on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColor: Color = .blue
    @State private var currentRGB: (red: Double, green: Double, blue: Double) = (0, 0, 1)

    private func randomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        currentRGB = (red: red, green: green, blue: blue)
        return Color(red: red, green: green, blue: blue)
    }

    private func getColorName(red: Double, green: Double, blue: Double) -> String {
        // Convert to 0-255 range for easier comparison
        let r = red * 255
        let g = green * 255
        let b = blue * 255

        // Determine color based on RGB values
        let maxValue = max(r, g, b)
        let minValue = min(r, g, b)
        let diff = maxValue - minValue

        // Check for grayscale
        if diff < 30 {
            if maxValue < 64 { return "black" }
            else if maxValue < 128 { return "dark gray" }
            else if maxValue < 192 { return "gray" }
            else if maxValue < 240 { return "light gray" }
            else { return "white" }
        }

        // Determine dominant color with modifiers
        var colorName = ""
        let brightness = (r + g + b) / 3

        // Add brightness modifier
        if brightness < 85 {
            colorName = "dark "
        } else if brightness > 170 {
            colorName = "light "
        }

        // Determine base color
        if r > g && r > b {
            if g > b * 1.5 { colorName += "orange" }
            else if b > g * 1.5 { colorName += "pink" }
            else { colorName += "red" }
        } else if g > r && g > b {
            if r > b * 1.5 { colorName += "yellow-green" }
            else if b > r * 1.5 { colorName += "cyan" }
            else { colorName += "green" }
        } else if b > r && b > g {
            if r > g * 1.5 { colorName += "purple" }
            else if g > r * 1.5 { colorName += "teal" }
            else { colorName += "blue" }
        } else if r > 200 && g > 200 && b < 100 {
            colorName = "yellow"
        } else if r > 200 && b > 200 && g < 100 {
            colorName = "magenta"
        } else if g > 200 && b > 200 && r < 100 {
            colorName = "cyan"
        } else {
            colorName += "mixed color"
        }

        return colorName
    }

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(circleColor)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        circleColor = randomColor()
                        let colorName = getColorName(red: currentRGB.red, green: currentRGB.green, blue: currentRGB.blue)
                        print("Button clicked, color: \(colorName)")
                    }
                    .padding()

                Spacer()
            }

            Spacer()

            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Welcome Alexandra!")
            }

            Spacer()
        }
        .foregroundColor(.orange)
    }
}

#Preview {
    ContentView()
}
