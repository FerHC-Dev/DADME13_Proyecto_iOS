//
//  ViewController.swift
//  asa
//
//  Created by Fernando Hernández on 03/05/25.
//

import UIKit

class ContactViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        textField.text = "Dinos tu mensaje"
        textField.textColor = .lightGray
        
        // Delegados de los campos
        setupDelegates(for: scrollView)
        
        // Observadores del teclado
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)

        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
    
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollToActiveField(textView)
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

    // MARK: - Observadores del teclado
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
        
    // MARK: - Scroll al campo activo

    func scrollToActiveField(_ activeField: UIView) {
        let frameInScroll = activeField.convert(activeField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(frameInScroll, animated: true)
    }
        
    // MARK: - Delegados de campos

    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollToActiveField(textField)
    }
    
    func setupDelegates(for view: UIView) {
        for subview in view.subviews {
            if let textField = subview as? UITextField {
                textField.delegate = self
            } else if let textView = subview as? UITextView {
                textView.delegate = self
            } else {
                // Recursividad para buscar en subviews anidadas
                setupDelegates(for: subview)
            }
        }
    }

}

