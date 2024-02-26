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
                            Text("Match")
                                .foregroundStyle(.white)
                            Image(systemName: "flag.and.flag.filled.crossed")
                                .foregroundStyle(.white)
                        }
                    }
                    TeamsView().tabItem {
                        VStack{
                            Text("Teams")
                                .foregroundStyle(.white)
                            Image(systemName: "person.3.fill")
                                .foregroundStyle(.white)
                               
                        }
                    }
                    VideoView().tabItem {
                        VStack{
                            Text("LiveStream")
                                .foregroundStyle(.white)
                            Image(systemName: "play.tv")
                                .foregroundStyle(.white)
                        }
                    }
                    AboutView().tabItem {
                        VStack{
                            Text("About")
                                .foregroundStyle(.white)
                            Image(systemName: "info.circle")
                                .foregroundStyle(.white)
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
