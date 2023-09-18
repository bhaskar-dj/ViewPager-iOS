//
//  ViewPagerApp.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/15/23.
//

import SwiftUI

@main
struct ViewPagerApp: App {
    @State var appState = ViewPagerAppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}

class ViewPagerAppState: ObservableObject {
    @Published var currentTabIndex: Int?
}
