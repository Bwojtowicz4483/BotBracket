//
//  AboutView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/26/24.
//

import Foundation
import SwiftUI
import WebKit
import AVKit
import FirebaseDatabaseSwift
import FirebaseDatabaseInternal

struct AboutView: View {
    @State var linkList: [String] = []
    var body: some View {
        
        VStack{
            HeaderView()
            ScrollView(.vertical, showsIndicators: false){
                Divider()
                Text("Meet the Developer")
                
                    .font(.largeTitle)
                    .bold()
                Divider()
                
                Text("Version 1.0")
                    .frame(width: 250)
                    .bold()
                Divider()
                VStack{
                    Text("Andrew Nowak")
                    Text("Adam Cubas")
                    Text("Ashley Saju")
                }
               
                Divider()
                
                Text("Version 2.0")
                    .frame(width: 250)
                    .bold()
                Divider()
                VStack{
                    Text("Ben Wojtowicz")
                    Text("Cody Brown")
                    Text("Vincent Chen")
                }
                
                .frame(width: 200)
                Divider()
                Text("Learn What We Do")
                    .bold()
                    .font(.largeTitle)
                Divider()
                VStack{
                    ForEach(linkList, id: \.self){ link in
                        YoutubeView(videoID: link)
                            .scaledToFill()
//                            .frame(minWidth:  UIScreen.main.bounds.width * 0.30, maxWidth: UIScreen.main.bounds.width * 0.50, minHeight:  UIScreen.main.bounds.height * 0.20, maxHeight: UIScreen.main.bounds.height * 0.50)
                        
                    }
                }
                .onAppear(){
                    pullURLS()
            }
        }
//        
        }
    }
    func pullURLS(){
        let databaseRef = Database.database().reference().child("Links").child("infoVideos")
        databaseRef.getData { myError, myDataSnapshot in
            var newList: [String] = []
            for links in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                guard let myLink = links.value as? [String: String] else { return }
                guard let link = myLink["link"] else { return }
                print(link)
                newList.append(link)
            }
                self.linkList = newList
        }
        
    }
}
