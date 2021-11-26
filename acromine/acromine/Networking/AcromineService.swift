//
//  AcromineService.swift
//  acromine
//
//  Created by Miguel on 26/11/21.
//

import Foundation
import Alamofire

protocol AcromineServiceProtocol{
    func getAcromines(request: AcromineRequest, completion: @escaping ([AcromineResponse]?, Error?) -> Void)
}

class AcromineService: AcromineServiceProtocol {
    
    func getAcromines(request: AcromineRequest, completion: @escaping ([AcromineResponse]?, Error?) -> Void) {
        let endPoint:AcromineEndpoint = .getAcromine(sf: request.sf)
        
        print(endPoint.toURL())
        
        AF.request(endPoint.toURL(), method: endPoint.method, headers: endPoint.headers)
            .response {[weak self] response in
                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        return
                    }
                    do {
                        let response = try JSONDecoder().decode([AcromineResponse].self, from: data)
                        completion(response, nil)
                    } catch(let error) {
                        completion(nil,error)
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                    completion(nil,error)
                }
            }
    }
}
