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
        let configuration = WKWebViewConfiguration()
              configuration.allowsInlineMediaPlayback = true
              
              let webView = WKWebView(frame: .zero, configuration: configuration)
              webView.navigationDelegate = context.coordinator
              return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "\(videoID)") else { return }
        
                let request = URLRequest(url: youtubeURL)
                uiView.load(request)
            }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

            webView.evaluateJavaScript("document.querySelector('video').play();", completionHandler: nil)
        }
    }
}

