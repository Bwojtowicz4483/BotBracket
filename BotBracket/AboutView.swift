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
            HStack{
            Image("DistrictLogo")
                .resizable()
                .frame(minWidth: 100, idealWidth: 240, maxWidth: 280, minHeight: 50, idealHeight: 80, maxHeight: 90)
            // .frame(minWidth: 100, idealWidth: 250, maxWidth: 400)
            
                .scaledToFit()
            Image("AppIconpic")
                .resizable()
                .frame(minWidth: 50, idealWidth: 100, maxWidth: 200, minHeight: 50, idealHeight: 100, maxHeight: 200)
                .scaledToFit()
            
        }
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
