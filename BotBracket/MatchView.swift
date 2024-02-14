//
//  MatchView.swift
//  BotBracket
//
//  Created by Cody Brown on 12/22/23.
//
import SwiftUI
import FirebaseCore
import FirebaseDatabase
import FirebaseDatabaseSwift

struct MatchView: View {
    
    @State var team1: Team = Team()
    @State var team2: Team = Team()
    
    @State var winnerDetermined = false
    @State var winnerName = ""
    @State var winnerNumber = "0"
    
    var body: some View {
        
        VStack {
            HeaderView()
            
            TeamView(currentTeam: team1)
            Spacer()
            Divider()
            Text("VS")
            Divider()
            TeamView(currentTeam: team2)
            Spacer()
        }
        .onAppear {
            loadDataFromFirebase()
        }
        .sheet(isPresented: $winnerDetermined) {
            WinnerView(name: winnerName, number: winnerNumber)
        }
        
    }
    
    func loadDataFromFirebase() {
        let database = Database.database().reference()
        
        database.child("CurrentMatch").observe(.value) { snapShot  in
            let snapShotArray = snapShot.children.allObjects as! [DataSnapshot]
            let team1 = snapShotArray[0].value as! String
            let team2 = snapShotArray[1].value as! String
            let winner = snapShotArray[2].value as! String
            let name = snapShotArray[3].value as! String
            
            
            
            if team1 == "0" && team2 == "0" {
                self.team1 = Team()
                self.team2 = Team()
                self.winnerName = ""
                self.winnerNumber = "0"
                self.winnerDetermined = false
                return
            }
            
            if winner != "0" {
                winnerDetermined = true
                winnerName = name
                winnerNumber = winner
            }
            
            database.child("RobotInfo").child(team1).observeSingleEvent(of: .value) { snapShot in
                let teamNumber = snapShot.key
                guard let data = snapShot.value as? NSDictionary else {return}
                guard let schoolName = data["school"] as? String else {return}
                guard let robotName = data["robotName"] as? String else {return}
                guard let schoolColor = data["color"] as? NSDictionary else {return}
                let red = CGFloat((schoolColor["red"] as! Double)/255.0)
                let green = CGFloat((schoolColor["green"] as! Double)/255.0)
                let blue = CGFloat((schoolColor["blue"] as! Double)/255.0)
                
                guard let record = data["record"] as? NSDictionary else {return}
                let win = record["win"] as! Int
                let lose = record["lose"] as! Int
                
                let students = data["students"] as! [String]
                
                self.team1 = Team(teamNumber: teamNumber, name: robotName, school: schoolName, wins: win, loses: lose, red: red, blue: blue, green: green, students: students)
                
            }
            
            database.child("RobotInfo").child(team2).observeSingleEvent(of: .value) { snapShot in
                let teamNumber = snapShot.key
                guard let data = snapShot.value as? NSDictionary else {return}
                guard let schoolName = data["school"] as? String else {return}
                guard let robotName = data["robotName"] as? String else {return}
                guard let schoolColor = data["color"] as? NSDictionary else {return}
                let red = CGFloat((schoolColor["red"] as! Double)/255.0)
                let green = CGFloat((schoolColor["green"] as! Double)/255.0)
                let blue = CGFloat((schoolColor["blue"] as! Double)/255.0)
                
                guard let record = data["record"] as? NSDictionary else {return}
                let win = record["win"] as! Int
                let lose = record["lose"] as! Int
                
                let students = data["students"] as! [String]
                
                self.team2 = Team(teamNumber: teamNumber, name: robotName, school: schoolName, wins: win, loses: lose, red: red, blue: blue, green: green, students: students)
            }
        }
    }
}
