//
//  BracketView.swift
//  BotBracket
//
//  Created by Cody Brown on 12/22/23.
//
//

import SwiftUI

struct TeamsView: View {
    @StateObject var teamViewModel = TeamViewModel()
    var body: some View {
        VStack {
                List(teamViewModel.teams, id: \.id) { team in
                    HStack() {
                        Rectangle()
                            .foregroundColor(team.schoolColor)
                            .frame(maxWidth: 15, maxHeight: .infinity, alignment: .leading)
                        Spacer()
                        VStack() {
                            Text("\(team.robotName)")
                                .font(.title)
                                .frame(alignment: .center)
                            Text("\(team.SchoolName)")
                                .font(.title3)
                                .frame(alignment: .center)
                        }
                        Spacer()
                        Text("(\(team.wins)-\(team.losses))")
                            .font(.title2)
                            .frame(alignment: .trailing)
                    }
                }
            }
        .onAppear {
                teamViewModel.pullFromFirebase()
            }
        }
       
    }

