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
                        VStack{
                            Label("Match",systemImage: "flag.and.flag.filled.crossed")
                                .foregroundStyle(.white)
                                .labelStyle(.iconOnly)
                            Label("Match",systemImage: "flag.and.flag.filled.crossed")
                                .foregroundStyle(.white)
                                .labelStyle(.titleOnly)
                        }
                    }
                    TeamsView().tabItem {
                        VStack{
                            Label("Teams",systemImage: "person.3.fill")
                                .foregroundStyle(.white)
                                .labelStyle(.iconOnly)
                            Label("Teams",systemImage: "person.3.fill")
                                .foregroundStyle(.white)
                                .labelStyle(.titleOnly)
                        }
                    }
                    VideoView().tabItem {
                        VStack{
                            Label("LiveStream",systemImage: "play.tv")
                                .foregroundStyle(.white)
                                .labelStyle(.iconOnly)
                            Label("LiveStream",systemImage: "play.tv")
                                .foregroundStyle(.white)
                                .labelStyle(.titleOnly)
                        }
                    }
                    AboutView().tabItem {
                        VStack{
                            Label("About",systemImage: "info.circle")
                                .foregroundStyle(.white)
                                .labelStyle(.iconOnly)
                            Label("About",systemImage: "info.circle")
                                .foregroundStyle(.white)
                                .labelStyle(.titleOnly)
                        }
                    }
                    
                }
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
                
            }
        }
    }
}
