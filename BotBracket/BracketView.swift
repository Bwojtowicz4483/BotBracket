//
//  BracketView.swift
//  BotBracket
//
//  Created by Cody Brown on 12/22/23.
//
//

import SwiftUI

struct BracketView: View {
    var array: [String] = ["placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder","placeholder"]
    var teams:[Teams]
    var body: some View {
       
        VStack{
           
         
           
            List(teams, id: \.self){ currentTeams in TeamView(currentTeam: currentTeams)
            
                }
                
                
                
            
            
           Text("Bracket of Teams")
                
                .foregroundStyle(.red)
               
               
        }
    }
}
