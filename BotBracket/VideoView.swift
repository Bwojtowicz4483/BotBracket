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
            YoutubeView(videoID: "wU0MIX0VBK4")
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.75)
        }
}
