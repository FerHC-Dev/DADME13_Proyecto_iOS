import UIKit

class ContactViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegados de los campos
        setupDelegates(for: scrollView)
        setupDelegates(for: textField)
        
        textField.text = "Dinos tu mensaje"
        textField.textColor = .lightGray
        
        // Observadores del teclado
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)

        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
    
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func btnEnviar(_ sender: UIButton) {
        inputName.text = inputName.text?.trimmingCharacters(in: .whitespaces)
        inputPhone.text = inputPhone.text?.trimmingCharacters(in: .whitespaces)
        inputEmail.text = inputEmail.text?.trimmingCharacters(in: .whitespaces)
        inputMessage.text = inputMessage.text?.trimmingCharacters(in: .whitespaces)
        if validate(){
            
        }
        
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
    
    func validate() -> Bool {
        var valide = false
        if(!isEmptyOrWhitespace(inputName.text) && !isEmptyOrWhitespace(inputEmail.text) && !isEmptyOrWhitespace(inputPhone.text) && !isEmptyOrWhitespace(inputMessage.text)){
            if isValidEmail(inputEmail.text!){
                if isNumbersOnly(inputPhone.text!){
                    valide = true
                }else{
                    inputPhone.text = ""
                    let ac = UIAlertController(title: "Hola", message: "Ingresa un número de contacto valido por favor.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default){
                        alertaction in
                    }
                    ac.addAction(action)
                    self.present(ac,animated: true)
                }
            }else{
                inputEmail.text = ""
                let ac = UIAlertController(title: "Hola", message: "Ingresa un correo valido por favor.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){
                    alertaction in
                }
                ac.addAction(action)
                self.present(ac,animated: true)
            }
        }else{
            let ac = UIAlertController(title: "Hola", message: "Favor de llenar todos los campos.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default){
                alertaction in
            }
            ac.addAction(action)
            self.present(ac,animated: true)
        }
        return valide
    }
    
    
    func isEmptyOrWhitespace(_ string: String?) -> Bool {
        guard let string = string else {
            return true 
        }
        return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    func isNumbersOnly(_ inputString: String) -> Bool {
        let numbersOnlyRegEx = "[0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", numbersOnlyRegEx)
        return predicate.evaluate(with: inputString) && inputString.count == 10
    }

}

