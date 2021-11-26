//
//  ViewController.swift
//  acromine
//
//  Created by Miguel on 25/11/21.
//

import UIKit

class AcromineView: UIViewController {
    
    @IBOutlet weak var acronimoTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var viewModel = AcromineViewModel(service: AcromineService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.setStyleScore(background: AppColors.newGreen, textButton: AppColors.white)
        
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        self.viewModel.acromineModels = []
        self.tableView.reloadData()
        guard let sf = self.acronimoTextField.text else {
            return
        }
        let request = AcromineRequest(sf: sf)
        viewModel.getAcromines(request: request)
    }
}

extension AcromineView : AcromineViewModelDelegate {
    func getAcromines(acromineModels: [AcromineModel]?, error: Error?) {
        self.tableView.reloadData()
    }
}

extension AcromineView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension AcromineView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.acromineModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        let model = self.viewModel.acromineModels[indexPath.row]
        var text = ""
        text += "sf: \(model.search) \r"
        for item in model.acromines {
            text += "lf: \(item.longform), freq: \(item.frequency), since: \(item.since) \r"
            if let variations = item.variations {
                for variation in variations {
                    text += "     lf: \(variation.longform), freq: \(variation.frequency), since: \(variation.since) \r"
                }
            }
        }
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = text
        return cell!
    }
    
}
