//
//  BotBracketApp.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 12/22/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

@main
struct BotBracketApp: App {
    init(){
        FirebaseApp.configure()
        print("Firebase Configured")
    }
    var body: some Scene {
        
        WindowGroup {
            ContentView()
            TabView {
                Group{
                    MatchView().tabItem {
                        Label("Match",systemImage: "flag.and.flag.filled.crossed")
                            .foregroundStyle(.white)
                    }
                    TeamsView().tabItem {
                        Label("Teams",systemImage: "person.3.fill")
                            .foregroundStyle(.white)
                    }
                    VideoView().tabItem {
                        Label("Video",systemImage: "play.tv")
                            .foregroundStyle(.white)
                    }
                    AboutView().tabItem {
                        Label("About",systemImage: "info.circle")
                            .foregroundStyle(.white)
                    }
                }
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
                
            }
        }
    }
}
