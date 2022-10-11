//
//  NewKounterData.swift
//  KitCount
//
//  Created by Marconi Gomes on 10/10/22.
//

import Foundation

struct NewKounterData {
    var name: String
    var goal: Int
    var desc: String
    
    static func empty() -> NewKounterData {
        return NewKounterData(name: "", goal: -1, desc: "")
    }
}
