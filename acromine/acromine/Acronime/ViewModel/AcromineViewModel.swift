//
//  AcromineViewModel.swift
//  acromine
//
//  Created by Miguel on 26/11/21.
//

import Foundation

protocol AcromineViewModelProtocol:AnyObject {
    func getAcromines(request:AcromineRequest)
    
    var delegate: AcromineViewModelDelegate? {get set}
    var service: AcromineServiceProtocol { get }
}

protocol AcromineViewModelDelegate: AnyObject {
    func getAcromines(acromineModels:[AcromineModel]? , error:Error?)
}

class AcromineViewModel:AcromineViewModelProtocol {
    
    var service:AcromineServiceProtocol
    var delegate:AcromineViewModelDelegate?
    var acromineModels:[AcromineModel] = []
    
    init(service: AcromineServiceProtocol) {
        self.service = service
    }
    
    func getAcromines(request:AcromineRequest) {
        self.service.getAcromines(request: request) { response, error in
            if let error = error {
                self.delegate?.getAcromines(acromineModels: nil, error: error)
            }
            
            if let response = response {
                for item in response {
                    let acromineModel = item.toAcromineModel()
                    self.acromineModels.append(acromineModel)
                }
                self.delegate?.getAcromines(acromineModels: self.acromineModels, error: nil)
            }
        }
    }
}
