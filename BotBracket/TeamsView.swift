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
           case school
           case alphabetical
           case mostWins
           case mostLosses
           case none
       }
    
    var sortedTeams: [Teams] {
           switch sortingOption {
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
            HStack{
                Spacer()
                Button(action: {
                    isPickerVisible.toggle()
                }) {
                    Text("Sort")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
                .padding()
                
            }
            if isPickerVisible {
                            Picker("Sort By", selection: $sortingOption) {
                                Text("School").tag(SortingOption.school)
                                Text("Alphabetical").tag(SortingOption.alphabetical)
                                Text("Most Wins").tag(SortingOption.mostWins)
                                Text("Most Losses").tag(SortingOption.mostLosses)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                        }
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
