//
//  VideoView.swift
//  BotBracket
//
//  Created by Cody Brown on 12/22/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var body: some View {
        VStack{
         Text("place Holder")
            VideoPlayer(player: AVPlayer(url:  URL(string: "https://www.youtube.com/watch?v=LXb3EKWsInQ")!))
                .frame(height: 400)
        }
    }
}
