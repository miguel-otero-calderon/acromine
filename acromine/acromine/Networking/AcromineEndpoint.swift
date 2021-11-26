//
//  AcromineEndpoint.swift
//  acromine
//
//  Created by Miguel on 26/11/21.
//

import Foundation
import Alamofire

enum AcromineEndpoint: EndPoint {
    case getAcromine(sf:String)
    
    var baseURL: String {
        return "http://www.nactem.ac.uk/software/acromine/"
    }
    var path: String {
        switch self {
        case .getAcromine(let sf):
            return "dictionary.py?sf=\(sf)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getAcromine:
            return .get
        }
    }
    var encoding: ParameterEncoding {
        switch self {
        case .getAcromine:
            return URLEncoding.default
        }
    }
    var headers: HTTPHeaders? {
        return [:]
    }
}

protocol EndPoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}
extension EndPoint {
    func toURL() -> URLConvertible {
        return baseURL + path
    }
}
