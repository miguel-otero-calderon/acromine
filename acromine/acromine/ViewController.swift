//
//  ViewController.swift
//  acromine
//
//  Created by Miguel on 25/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var acronimoTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchButton.setStyleScore(background: AppColors.newGreen, textButton: AppColors.white)
    }

    @IBAction func searchAction(_ sender: Any) {
        print("1111")
    }
    
}

