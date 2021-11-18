//
//  WriteDiaryViewController.swift
//  05_DiaryClone
//
//  Created by Seydoux on 2021/11/16.
//

import UIKit

enum DiaryEditMode {
    case new
    case edit(Diary, IndexPath)
}

protocol WriteDiaryViewControllerDelegate: AnyObject {
    func writeDiary(diary: Diary)
}

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    var datePicker = UIDatePicker()
    var diaryDate: Date?
    var delegate: WriteDiaryViewControllerDelegate?
    var editMode: DiaryEditMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.confirmButton.isEnabled = false
        self.initTextView()
        self.initTextField()
        
        switch editMode {
        case .edit(let diary, _):
            self.titleTextField.text = diary.title
            self.contentTextView.text = diary.content
            self.dateTextField.text = dateToString(from: diary.date)
            
            self.confirmButton.title = "수정"
        default: break
        }
    }
    
    private func initTextView() {
        self.contentTextView.layer.borderColor = UIColor.black.cgColor
        self.contentTextView.layer.borderWidth = 1.0
        self.contentTextView.layer.cornerRadius = 3.0
    }
    
    private func initTextField() {
        self.titleTextField.addTarget(self, action: #selector(validateTextField), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(validateTextField), for: .editingChanged)
        self.contentTextView.delegate = self
        
        self.datePicker.locale = Locale(identifier: "ko_KR")
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(dateDidChanged(_:)), for: .valueChanged)
        self.dateTextField.inputView = self.datePicker
    }
    @objc private func dateDidChanged(_ datePicker: UIDatePicker) {
        self.dateTextField.text = dateToString(from: self.datePicker.date)
        self.diaryDate = self.datePicker.date
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    @objc private func validateTextField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.contentTextView.text.isEmpty) && !(self.dateTextField.text?.isEmpty ?? true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let content = self.contentTextView.text else { return }
        guard let date = self.diaryDate else { return }
        
        let diary = Diary(title: title, content: content, date: date, isStar: false)
        self.delegate?.writeDiary(diary: diary)
        self.navigationController?.popViewController(animated: true)
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateTextField()
    }
}
