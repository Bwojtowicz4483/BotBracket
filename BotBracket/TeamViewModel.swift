//
//  TeamViewModel.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 1/25/24.
//

import Foundation
import FirebaseCore
import FirebaseDatabase
import FirebaseDatabaseSwift
import SwiftUI


class TeamViewModel: ObservableObject{
    @Published var teams: [Teams] = []
    
    init() {
        pullFromFirebase()
    }
    
    func pullFromFirebase() {
        let databaseRef = Database.database().reference().child("RobotInfo")
        databaseRef.getData { myError, myDataSnapshot in
            var newList = [Teams]()
            
            for robot in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let teamNumber = robot.key
                guard let dictionary = robot.value as? [String: Any] else { return }
                guard let schoolName = dictionary["school"] as? String else { return }
                guard let robotName = dictionary["robotName"] as? String else { return }
                
                guard let record = dictionary["record"] as? [String: Int] else { return }
                guard let wins = record["win"] else { return }
                guard let losses = record["lose"] else { return }
                
                guard let color = dictionary["color"] as? [String: Int] else { return }
                guard let blue = color["blue"] else { return }
                guard let green = color["green"] else { return }
                guard let red = color["red"] else { return }
                
                let sizedRed = Double(red) / 255.0
                let sizedGreen = Double(green) / 255.0
                let sizedBlue = Double(blue) / 255.0
                
                let schoolColor = Color(red: sizedRed, green: sizedGreen, blue: sizedBlue)
                let team = Teams(teamNumber: teamNumber, SchoolName: schoolName, robotName: robotName, wins: wins, losses: losses, schoolColor: schoolColor)
                newList.append(team)
            }
            self.teams = newList
        }
    }
}
    
    

