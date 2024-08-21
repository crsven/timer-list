//
//  ContentView.swift
//  TimerList
//
//  Created by Chris Svenningsen on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    let timerViews = [
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView(),
        TimerView()
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(timerViews, id: \.id) { timerView in
                    timerView
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
