//
//  HeaderView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/14/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("DistrictLogo")
                .resizable()
                .frame(minWidth: 100, idealWidth: 240, maxWidth: 280, minHeight: 50, idealHeight: 80, maxHeight: 90)
               // .frame(minWidth: 100, idealWidth: 250, maxWidth: 400)
                
                .scaledToFit()
            Text("Robot Rumble")
                .frame(width: 250)
                .font(.largeTitle)
        }
        .padding()
    }
}
