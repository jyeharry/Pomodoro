//
//  TimerView.swift
//  Pomodoro Watch App
//
//  Created by Jye Harry on 12/8/2024.
//

import SwiftUI

struct TimerView: View {
    static let startingTime = 60 * 25
    @State private var secsRemaining = startingTime
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView {
            VStack {
                Text("Time: \(formatTime(secsRemaining))")
                    .multilineTextAlignment(.center)
                    .font(.title2)

                Button(action: restartTime) {
                    Text("Restart timer")
                        .foregroundStyle(.white)
                }
            }
            .onReceive(timer) { _ in
                if secsRemaining > 0 {
                    secsRemaining -= 1
                    return
                }
            }
        }
    }
    
    func formatTime(_ value: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(value)) ?? "00:00"
    }
    
    func restartTime() {
        secsRemaining = TimerView.startingTime
    }
}


#Preview {
    TimerView()
}
