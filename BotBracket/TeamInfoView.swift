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
        Image(systemName: "camera.metering.unknown")
            .resizable()
            .frame(minWidth: 100, idealWidth: 240, maxWidth: 280, minHeight: 50, idealHeight: 80, maxHeight: 90)
        
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
