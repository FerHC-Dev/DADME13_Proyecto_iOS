//
//  ViewController.swift
//  asa
//
//  Created by Fernando Hernández on 03/05/25.
//

import UIKit

class ContactViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        textField.text = "Dinos tu mensaje"
        textField.textColor = .lightGray
    
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.textColor = .black
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .lightGray
            textView.text = "Dinos tu mensaje"
        }
    }

}

