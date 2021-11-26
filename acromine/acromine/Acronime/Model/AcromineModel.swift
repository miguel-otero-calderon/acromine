//
//  AcromineModel.swift
//  acromine
//
//  Created by Miguel on 26/11/21.
//

import Foundation

struct AcromineModel {
    let search:String
    let acromines: [Acromine]
}

struct Acromine {
    let longform: String
    let frequency: Int
    let since: Int
    let variations: [Acromine]?
}
