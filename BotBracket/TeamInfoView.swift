//
//  TeamInfoView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 3/5/24.
//

import Foundation
import SwiftUI

struct TeamInfoView: View {
    
    
    let team: Teams
    
    init(team: Teams) {
        self.team = team
    }
    var body: some View {
        VStack {
            Divider()
            Text("# \(team.teamNumber) - \(team.robotName)")
                .font(.title)
                    HStack{
                Image(team.teamNumber)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100, alignment: .leading)
//                Spacer()
                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/robotrumble-6f4a6.appspot.com/o/Unknown-1.jpeg?alt=media&token=1fe1053a-10a6-42c7-8b52-f955abbcf968")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: 175, maxHeight: 100, alignment: .center)
            }
//                Divider()
            List {
                ForEach(team.students, id: \.self) { student in
                    Text(student)
                        .font(.title3)
                }
                
            }
        }
        
    }
}
