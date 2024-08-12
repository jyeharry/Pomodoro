//
//  ContentView.swift
//  Pomodoro Watch App
//
//  Created by Jye Harry on 12/8/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Pomodoro").font(.title2)
                NavigationLink("Start timer") {
                    TimerView()
                }
            }
        }
        .padding()
    }
    
    func startTimer() {
        
    }
}

#Preview {
    ContentView()
}
