//
//  ContentView.swift
//  TimerList
//
//  Created by Chris Svenningsen on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20) { _ in
                    TimerView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
