//
//  ViewController.swift
//  acromine
//
//  Created by Miguel on 25/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = AcromineService()
        service.getAcromines(request: AcromineRequest(sf: "HMM")) { response, error in
            print(response)
            print(error)
        }
    }


}

