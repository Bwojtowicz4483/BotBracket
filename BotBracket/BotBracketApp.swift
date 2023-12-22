//
//  BotBracketApp.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 12/22/23.
//

import SwiftUI

@main
struct BotBracketApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            TabView {
                MatchView().tabItem {
                    Text("Match")
                }
                BracketView().tabItem {
                    Text("Bracket")
                }
                VideoView().tabItem {
                    Text("Video")
                }
                
            }
            
            
        }
    }
}
