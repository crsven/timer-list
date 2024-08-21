//
//  VisibleTimer.swift
//  TimerList
//
//  Created by Chris Svenningsen on 8/20/24.
//

import Foundation

@Observable
class VisibleTimer {
    var elapsedTime: Double = 0
    var timer: Timer?
    var lastStartTime: Date?
    var lastElapsedTime: Double = 0
    
    func resume() {
        if lastStartTime == nil {
            lastStartTime = Date.now
        }
        lastElapsedTime = elapsedTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            self.elapsedTime = self.lastElapsedTime + Date.now.timeIntervalSince(self.lastStartTime!)
        })
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
        lastStartTime = nil
    }
}
