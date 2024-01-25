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
    
    var body: some View {
       
        VStack{
           
         
           
            List(array, id: \.self){ array in Text(array)
            
                    
                    
                }
                
                
                
            
            
           Text("Bracket of Teams")
                
                .foregroundStyle(.red)
               
               
        }
    }
}
