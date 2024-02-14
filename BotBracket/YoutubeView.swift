//
//  YoutubeView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 1/23/24.
//

import SwiftUI
import WebKit
import FirebaseCore
import FirebaseDatabase
import FirebaseDatabaseSwift
import SwiftUI

struct YoutubeView: UIViewRepresentable {

    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "\(videoID)") else { return }
           
           uiView.scrollView.isScrollEnabled = false
           uiView.load(URLRequest(url: youtubeURL))
       }
}
