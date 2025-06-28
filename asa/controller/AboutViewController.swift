import UIKit
import SafariServices

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Nosotros"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaberMas(_ sender: UIButton) {
        if isConnected{
            
            if let url = URL(string: "https://www.gob.mx/asa"){
                
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                
                let safariViewController = SFSafariViewController(url: url, configuration: config)
                self.present(safariViewController, animated: true)
            }
        }else{
            print("Connection error")
        }
    }
    


}
