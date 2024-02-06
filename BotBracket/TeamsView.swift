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
         
                Button("Filter"){}
                .frame( alignment: .topLeading)
                .padding()
                                   .background(.red)
                                   .mask(Circle())
          
                .foregroundColor(.white)
                List(teamViewModel.teams, id: \.id) { team in
                    HStack() {
//                            .frame(maxWidth: 10, maxHeight: .infinity)
                            
                        VStack() {
                            Text("\(team.robotName)")
                            
                            Text("\(team.SchoolName)")
                        }
                        Spacer()
                        Text("(\(team.wins)-\(team.losses))")
                    }
                }
            }
        .onAppear {
                teamViewModel.pullFromFirebase()
            }
        }
       
    }

