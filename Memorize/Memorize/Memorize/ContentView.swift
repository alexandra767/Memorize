//
//  ContentView.swift
//  Memorize
//
//  Created by Alexandra Titus on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColor: Color = .blue

    private func randomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(circleColor)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        circleColor = randomColor()
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
