//
//  TimerView.swift
//  TimerList
//
//  Created by Chris Svenningsen on 8/20/24.
//

import SwiftUI

struct TimerView: View {
    var id = UUID()
    var timer = VisibleTimer()

    var body: some View {
        Text("Time on screen: \(timer.secondsElapsed)")
            .padding(.vertical, 30)
            .onGeometryChange(
                for: Bool.self, of: isVisible(proxy:),
                action: updateTimer(isVisible:))
    }

    private func isVisible(proxy: GeometryProxy) -> Bool {
        guard let bounds = proxy.bounds(of: .scrollView) else { return false }
        let frame = proxy.frame(in: .scrollView)
        let intersection = frame.intersection(
            CGRect(origin: .zero, size: bounds.size))
        let isVisible = intersection.size.height > 0

        return isVisible
    }

    private func updateTimer(isVisible: Bool) {
        isVisible ? timer.resume() : timer.pause()
    }
}

#Preview("Single") {
    TimerView()
}

#Preview("Multiple") {
    VStack {
        TimerView()
        TimerView()
        TimerView()
        TimerView()
        TimerView()
        TimerView()
    }
}
