//
//  AddAlertViewController.swift
//  12_Drink
//
//  Created by Seydoux on 2021/11/23.
//

import UIKit

class AddAlertViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        
        self.dismiss(animated: true, completion: nil)
    }
}
