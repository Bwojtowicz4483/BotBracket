//
//  AboutView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/26/24.
//

import Foundation
import SwiftUI
import WebKit

struct AboutView: View {
    
    var body: some View {
        
            VStack{
                HeaderView()
                ScrollView(.vertical, showsIndicators: false){
                Divider()
                Text("Meet the Developer")
                
                    .font(.largeTitle)
                Divider()
                
                Text("Version 1.0")
                    .frame(width: 250)
                
                Divider()
                VStack{
                    Text("Andrew Nowak")
                    Text("Adam Cubas")
                    Text("Ashley Saju")
                }
                Divider()
                
                Text("Version 2.0")
                    .frame(width: 250)
                
                Divider()
                VStack{
                    Text("Ben Wojtowicz")
                    Text("Cody Brown")
                    Text("Vincent Chen")
                }
                Divider()
                Text("Learn What We Do")
                
                    .font(.largeTitle)
                Divider()
                VStack{
                    
                    
                }
            }
            
            
        }
        
    }
}
