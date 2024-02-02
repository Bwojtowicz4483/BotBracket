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
                    HStack() {
                        VStack(alignment: .leading) {
                            Text("\(team.robotName)")
                                .font(.title)
                            Text("\(team.SchoolName)")
                                .font(.title2)
                        }
                        Spacer()
                        Text("(\(team.wins)-\(team.losses))")
                            .font(.title)
                    }
                }
            }
        .onAppear {
                teamViewModel.pullFromFirebase()
            }
        }
       
    }

