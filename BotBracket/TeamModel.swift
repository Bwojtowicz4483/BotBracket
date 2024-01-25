//
//  Teams.swift
//  BotBracket
//
//  Created by cody brown  on 1/23/24.
//

import Foundation
import SwiftUI

struct Teams: Hashable {
    var id = UUID()
    var SchoolName:String
    var robotName:String
    var wins:Int
    var losses:Int
}
