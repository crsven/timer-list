//
//  VisibleTimer.swift
//  TimerList
//
//  Created by Chris Svenningsen on 8/20/24.
//

import Foundation

@Observable
class VisibleTimer {
    var secondsElapsed: Double = 0
    var timer: Timer?
    var lastStartTime: Date?
    var secondsAtLastPause: Double = 0
    
    func resume() {
        if lastStartTime == nil {
            lastStartTime = Date.now
        }
        secondsAtLastPause = secondsElapsed
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            self.secondsElapsed = self.secondsAtLastPause + Date.now.timeIntervalSince(self.lastStartTime!)
        })
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
        lastStartTime = nil
    }
}
