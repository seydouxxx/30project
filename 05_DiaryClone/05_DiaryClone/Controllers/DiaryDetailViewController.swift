//
//  DiaryDetailViewController.swift
//  05_DiaryClone
//
//  Created by Seydoux on 2021/11/16.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var diary: Diary?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    private func configureView() {
        guard let diary = self.diary else { return }
        
        titleLabel.text = diary.title
        contentTextView.text = diary.content
        dateLabel.text = dateToString(from: diary.date)
    }
    @IBAction func tapEditButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
        guard let diary = self.diary, let indexPath = self.indexPath else { return }
        viewController.editMode = .edit(diary, indexPath)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func tapDeleteButton(_ sender: UIButton) {
    }
}
