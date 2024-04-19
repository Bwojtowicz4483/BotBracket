//
//  YoutubeView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 1/23/24.
//

import SwiftUI
import WebKit

struct YoutubeView: View {
    let videoID: String
    
    var body: some View {
        WebView(urlString: "\(videoID)")
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
