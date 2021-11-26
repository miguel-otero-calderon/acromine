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


extension AcromineResponse {
    func toAcromineModel() -> AcromineModel {
        return AcromineModel(search: self.sf, acromines: self.lfs.map({ item in
            item.toAcromine()
        }))
    }
}

extension AcromineResponseData {
    func toAcromine() -> Acromine {
        if let vars = self.vars {
            var variations = [Acromine]()
            for item in vars {
                let acromine = item.toAcromine()
                variations.append(acromine)
            }
            return Acromine(longform: self.lf, frequency: self.freq, since: self.since, variations: variations)
        } else {
            return Acromine(longform: self.lf, frequency: self.freq, since: self.since, variations: nil)
        }
    }
}
