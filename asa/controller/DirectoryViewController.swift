import UIKit

class DirectoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Directorio"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCall(_ sender: UIButton) {
        realizarLlamada(telefono: Constants.DirectoryView.phone)
    }
    
    func realizarLlamada(telefono: String) {
        let urlString = "tel://\(telefono)"
        
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            Utils.showAlert(Constants.Titles.error, Constants.DirectoryView.callError,self)
        }
    }

}
