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
    @State private var sortingOption = SortingOption.none
    @State private var isPickerVisible = false
    enum SortingOption {
           case team
           case school
           case alphabetical
           case mostWins
           case mostLosses
           case none
       }
    
    var sortedTeams: [Teams] {
           switch sortingOption {
           case .team:
               return teamViewModel.teams
           case .school:
               return teamViewModel.teams.sorted(by: { $0.SchoolName < $1.SchoolName })
           case .alphabetical:
               return teamViewModel.teams.sorted(by: { $0.robotName < $1.robotName })
           case .mostWins:
               return teamViewModel.teams.sorted(by: { $0.wins > $1.wins })
           case .none:
               return teamViewModel.teams
           case .mostLosses:
               return teamViewModel.teams.sorted(by: { $0.losses > $1.losses })
           }
       }
    
    var body: some View {
        VStack {
            HeaderView()
                            Picker("Sort By", selection: $sortingOption) {
                                Text("Team #").tag(SortingOption.team)
                                Text("School").tag(SortingOption.school)
                                Text("Name").tag(SortingOption.alphabetical)
                                Text("Wins").tag(SortingOption.mostWins)
                                Text("Losses").tag(SortingOption.mostLosses)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                        
                List(sortedTeams, id: \.id) { team in
                    HStack() {
                        Rectangle()
                            .foregroundColor(team.schoolColor)
                            .frame(maxWidth: 10, maxHeight: .infinity, alignment: .leading)
                        Spacer()
                        VStack() {
                            Text("\(team.robotName)")
                                .font(.title)
                                .frame(alignment: .center)
                            Text("#\(team.teamNumber) - \(team.SchoolName)")
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
