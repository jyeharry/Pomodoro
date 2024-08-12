//
//  TimerView.swift
//  Pomodoro Watch App
//
//  Created by Jye Harry on 12/8/2024.
//

import SwiftUI

struct TimerView: View {
    @State private var secsRemaining = 5
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Time: \(formatTime(secsRemaining))")
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(.blue.opacity(0.75))
                .clipShape(.capsule)
        }
        .onReceive(timer) { _ in
            if secsRemaining > 0 {
                secsRemaining -= 1
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
}


#Preview {
    TimerView()
}
