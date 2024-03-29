//
//  TeamModel.swift
//  BotBracket
//
//  Created by Ben Wojtowicz on 2/2/24.
//

import Foundation
import SwiftUI

struct Teams: Hashable {
    var id = UUID()
    let teamNumber: String
    var SchoolName:String
    var robotName:String
    var wins:Int
    var losses:Int
    var schoolColor:Color
    var students: [String]
}
