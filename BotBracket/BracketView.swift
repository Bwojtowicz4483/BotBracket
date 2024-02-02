//
//  BracketView.swift
//  BotBracket
//
//  Created by Cody Brown on 12/22/23.
//
//

import SwiftUI

struct BracketView: View {
    @StateObject var teamViewModel = TeamViewModel()
    
    var body: some View {
        VStack {
                List(teamViewModel.teams, id: \.id) { team in
                    VStack(alignment: .leading) {
                        Text("School: \(team.SchoolName)")
                        Text("Robot Name: \(team.robotName)")
                        Text("Wins: \(team.wins)")
                        Text("Losses: \(team.losses)")
                    }
                }
            }
        .onAppear {
                teamViewModel.pullFromFirebase()
            }
        }
       
    }

