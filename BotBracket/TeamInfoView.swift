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
        Image(systemName: "camera.metering.unknown")
            .resizable()
            .frame(minWidth: 100, idealWidth: 240, maxWidth: 280, minHeight: 50, idealHeight: 80, maxHeight: 90)
        
        VStack {
//            Text("Team Members")
//                .font(.title)
                
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
