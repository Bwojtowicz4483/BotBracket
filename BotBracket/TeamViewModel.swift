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
                guard let dictionary = robot.value as? [String: Any] else {
                    continue
                }
                guard let schoolName = dictionary["school"] as? String,
                      let robotName = dictionary["robotName"] as? String,
                      let record = dictionary["record"] as? [String: Int],
                      let wins = record["win"],
                      let losses = record["lose"] else { return }
                    let team = Teams(SchoolName: schoolName, robotName: robotName, wins: wins, losses: losses)
                                    newList.append(team)
                }
                self.teams = newList
            }
        }
        
    }
    

