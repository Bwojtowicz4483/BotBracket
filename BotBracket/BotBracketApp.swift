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
              //  Group{
                    MatchView().tabItem {
                        Label("Match",systemImage: "flag.and.flag.filled.crossed")
                            .foregroundStyle(.white)
                    }
                    BracketView(teams: []).tabItem {
                        Label("Bracket",systemImage: "person.3.fill")
                            .foregroundStyle(.white)
                    }
                    VideoView().tabItem {
                        Label("Video",systemImage: "play.tv")
                            .foregroundStyle(.white)
                        //    .background(
                        //       RoundedRectangle(cornerRadius: 10.0)
                        //              .foregroundStyle(.red, .gray)
                        //                            )
                    }
                }
                .toolbarBackground(.red, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
                
            }
        }
    }
}
