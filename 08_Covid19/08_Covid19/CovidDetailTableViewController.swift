//
//  CovidDetailTableViewController.swift
//  08_Covid19
//
//  Created by Seydoux on 2021/11/18.
//

import UIKit

class CovidDetailTableViewController: UITableViewController {

    @IBOutlet weak var newCaseCell: UILabel!
    @IBOutlet weak var totalCaseCell: UILabel!
    @IBOutlet weak var recoveredCaseCell: UILabel!
    @IBOutlet weak var deathCaseCell: UILabel!
    @IBOutlet weak var percentageCell: UILabel!
    @IBOutlet weak var overseaCaseCell: UILabel!
    @IBOutlet weak var localCaseCell: UILabel!
    
    var covidOverview: CovidOverView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    func configureView() {
        guard let covidOverview = self.covidOverview else { return }
        self.title = covidOverview.countryName
        self.newCaseCell.text = "\(covidOverview.newCase)명"
        self.totalCaseCell.text = "\(covidOverview.totalCase)명"
        self.recoveredCaseCell.text = "\(covidOverview.recovered)명"
        self.deathCaseCell.text = "\(covidOverview.death)명"
        self.percentageCell.text = "\(covidOverview.percentage)%"
        self.overseaCaseCell.text = "\(covidOverview.newFcase)명"
        self.localCaseCell.text = "\(covidOverview.newCcase)명"
    }
}
