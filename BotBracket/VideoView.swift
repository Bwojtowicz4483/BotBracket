//
//  VideoView.swift
//  BotBracket
//
//  Created by Cody Brown on 12/22/23.
//

import SwiftUI
import AVKit
import FirebaseDatabaseInternal

struct VideoView: View {
    @State var myUrl: String = ""

    var body: some View {
        VStack{
            YoutubeView(videoID: myUrl)
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.75)
        }
        .onAppear(){
            pullURL()
        }
    }


        
    func pullURL(){
        let databaseRef = Database.database().reference().child("Links")
        databaseRef.getData { myError, myDataSnapshot in
            var newURL = ""
            guard let myLink = myDataSnapshot?.value as? [String: String] else { return }
            guard let link = myLink["url"] else { return }
            print(link)
                newURL = link
            print(newURL)
            DispatchQueue.main.async {
                self.myUrl = newURL

            }
        }
    }
}
