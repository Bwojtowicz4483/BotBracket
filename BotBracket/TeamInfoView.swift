//
//  TeamInfoView.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 3/5/24.
//

import Foundation
import SwiftUI
import FirebaseDatabaseInternal
struct TeamInfoView: View {
    @State var myImage: String = ""
    
    let team: Teams
    
    init(team: Teams) {
        self.team = team
    }
    var body: some View {
        VStack {
            Divider()
            Text("# \(team.teamNumber) - \(team.robotName)")
                .font(.title)
                    HStack{
                Image(team.teamNumber)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100, alignment: .leading)
                  Spacer()
                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/robotrumble-6f4a6.appspot.com/o/Unknown-1.jpeg?alt=media&token=1fe1053a-10a6-42c7-8b52-f955abbcf968")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: 250, maxHeight: 175, alignment: .leading)
            }
                Divider()
            List {
                ForEach(team.students, id: \.self) { student in
                    Text(student)
                        .font(.title3)
                }
                
            }
        }
        .onAppear(){
            pullRImage()
        }
//        .frame(width: 200,height: 200)
        
    }
    func pullRImage(){
        let databaseRef = Database.database().reference().child("RobotInfo")
        databaseRef.getData { myError, myDataSnapshot in
            var newimage = ""
            guard let myImage = myDataSnapshot?.value as? [String: String] else { return }
            guard let image = myImage["robotImage"] else { return }
            print(image)
                newimage = image
            print(newimage)
            DispatchQueue.main.async {
                self.myImage = newimage

            }
        }
    }
}
