//
//  BotBracketApp.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 12/22/23.
//

import SwiftUI

@main
struct BotBracketApp: App {
  //  @State var wordplay: WordPlay = WordPlay()
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
          //  ContentView(wordplay: $wordplay)

            TabView {
                Group{
                    MatchView().tabItem {
                        Label("Match",systemImage: "circle")
                    }
                    BracketView().tabItem {
                        Label("Bracket",systemImage: "circle")
                    }
                    VideoView().tabItem {
                        Label("Video",systemImage: "circle")
                    }
                }
                .toolbarBackground(.red, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
             }
        }
    }
}
