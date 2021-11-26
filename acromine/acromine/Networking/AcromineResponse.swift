//
//  AcromineResponse.swift
//  acromine
//
//  Created by Miguel on 26/11/21.
//

import Foundation

struct AcromineResponse: Codable {
    let sf: String
    let lfs: [AcromineResponseData]
}

// MARK: - LF
struct AcromineResponseData: Codable {
    let lf: String
    let freq, since: Int
    let vars: [AcromineResponseData]?
}
