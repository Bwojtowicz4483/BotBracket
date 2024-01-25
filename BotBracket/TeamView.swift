//
//  TeamView.swift
//  BotBracket
//
//  Created by cody brown  on 1/23/24.
//

import Foundation
import SwiftUI

struct TeamView:View {
    let currentTeam:Teams
    var body: some View {
        HStack{
            VStack(alignment: .center){
                Text(currentTeam.robotName)
                    .font(.largeTitle)
                Text(currentTeam.SchoolName)
                    .font(.title3)
            }
          
        }
    }
}
