//
//  NoticeViewController.swift
//  11_Notice
//
//  Created by Seydoux on 2021/11/23.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var noticeContents: (title: String, detail: String, date: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.noticeView.layer.cornerRadius = 6
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        guard let noticeContents = noticeContents else { return }
        self.titleLabel.text = noticeContents.title
        self.detailLabel.text = noticeContents.detail
        self.dateLabel.text = noticeContents.date
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

