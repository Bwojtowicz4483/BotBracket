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
import FirebaseDatabaseInternal

struct AboutView: View {
    var linkList = ["https://www.youtube.com/embed/UdYj5LmeQIQ?si=29ixUIErAawj0Mmb&?playsinline=0","https://www.youtube.com/embed/1kgkxAU2Yjw?si=NkRP_WY7FUobBYzV&?playsinline=0","https://www.youtube.com/embed/cXAnrKwsDYA?si=3j3hZOM_IGmI03_o&?playsinline=0"]
    @State var linkList2: [String] = []
    var keyVal = "link"
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
                    ForEach(linkList, id: \.self) { videoID in
                        YoutubeView(videoID: videoID)
                            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.40)
                    }
                    
                    
                }
            }
        }
        .onAppear(){
            pullURLS(keyVal: keyVal)
        }
    }
    func pullURLS(keyVal: String){
        let databaseRef = Database.database().reference().child("Links").child("infoVideos")
        databaseRef.getData { myError, myDataSnapshot in
            var newList: [String] = []
            for links in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                guard let myLink = links.value as? [String: String] else { return }
                guard let link = myLink[keyVal] else { return }
                print(link)
                newList.append(link)
            }
                self.linkList2 = newList
        }
        
    }
}
