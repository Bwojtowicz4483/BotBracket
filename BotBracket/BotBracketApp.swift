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
                           
                            Image(systemName: "flag.and.flag.filled.crossed")
                                .foregroundStyle(.white)
                            Text("Match")
                                .foregroundStyle(.white)
                        }
                    }
                    TeamsView().tabItem {
                        VStack{
                            Image(systemName: "person.3.fill")
                                .foregroundStyle(.white)
                            Text("Teams")
                                .foregroundStyle(.white)
                        }
                    }
                    VideoView().tabItem {
                        VStack{
                            Image(systemName: "play.tv")
                                .foregroundStyle(.white)
                            Text("LiveStream")
                                .foregroundStyle(.white)
                        }
                    }
                    AboutView().tabItem {
                        VStack{
                            Image(systemName: "info.circle")
                                .foregroundStyle(.white)
                            Text("About")
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
