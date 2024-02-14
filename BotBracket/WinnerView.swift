//
//  WinnerView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/14/24.
//

import Foundation
import SwiftUI

struct WinnerView: View {
    
    let name: String
    let number: String
    
    var body: some View {
        Text("Swipe Down to Dismiss")
            .padding()
        Spacer()
        VStack {

            Text("The Winner is...")

            Text("Team #\(number)")
            Text(name)
            Image(number)
                .resizable()
                .frame(width: 200, height: 200)
            
        }
        .font(.system(size: 40))
        Spacer()
        
    }
}

