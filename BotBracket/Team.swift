//
//  Team.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/14/24.
//

import Foundation
import UIKit
import SwiftUI

struct Team {
    let teamNumber: String
    let name: String
    let school: String
    let wins: Int
    let loses: Int
    let students: [String]
    let red: CGFloat
    let blue: CGFloat
    let green: CGFloat
    
    init() {
        teamNumber = ""
        name = ""
        school = ""
        wins = 0
        loses = 0
        students = []
        red = 0.9
        blue = 0.0
        green = 0.0
    }
    
    init(teamNumber: String,name: String,school: String,wins: Int,loses: Int, red: CGFloat, blue: CGFloat, green: CGFloat, students: [String]) {
        self.teamNumber = teamNumber
        self.name = name
        self.school = school
        self.wins = wins
        self.loses = loses
        self.students = students
        self.red = red
        self.blue = blue
        self.green = green
    }
}

