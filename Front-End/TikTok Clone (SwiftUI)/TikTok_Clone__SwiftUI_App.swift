//
//  TikTok_Clone__SwiftUI_App.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

@main
struct TikTok_Clone__SwiftUI_App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house.fill") }
                Color.black
            }
            .tint(.white)
            .preferredColorScheme(.dark)
        }
    }
}
