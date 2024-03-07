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
//            Text("Team Members")
//                .font(.title)
                
            List {
                ForEach(team.students, id: \.self) { student in
                    Text(student)
                        .font(.title3)
                }
            }
        }
        
    }
}
