//
//  TeamView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/14/24.
//

import SwiftUI

struct TeamView: View {
    let currentTeam: Team
    var body: some View {
        VStack {
            if(currentTeam.teamNumber != "") {
                
                Group {
                    HStack {
                        Image(currentTeam.teamNumber)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .aspectRatio(contentMode: .fit)
                        VStack {
                            Text("Team #\(currentTeam.teamNumber)")
                                .frame(maxWidth: .infinity)
                            Text(currentTeam.school)
                                .font(.subheadline)
                        }
                        .foregroundColor(.white)
                        
                    }
                    .padding()
                    .background(Color(uiColor: UIColor(red: currentTeam.red, green: currentTeam.green, blue: currentTeam.blue, alpha: 1)))
                    
                    Text(currentTeam.name)
                }
                .font(.largeTitle)
                
                Text("\(currentTeam.wins) - \(currentTeam.loses)")
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))] ) {
                    ForEach(currentTeam.students, id: \.self) { student in
                        Text(student)
                        
                    }
                }
            }
        }
    }
}

