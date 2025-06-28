import UIKit
import SafariServices
import PDFKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = Constants.moduleName.about
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaberMas(_ sender: UIButton) {
        if isConnected{
            if let url = URL(string: Constants.Urls.asaHome){
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let safariViewController = SFSafariViewController(url: url, configuration: config)
                self.present(safariViewController, animated: true)
            }
        }else{
            Utils.showAlert(Constants.Titles.warning, Constants.Titles.connectionError, self)
        }
    }
    @IBAction func btnAvisodePriv(_ sender: UIButton) {
        Utils.abrirPDF(Constants.PDFS.privacidad,self,Constants.PDFViewController.privacidad)
    }
    @IBAction func btnTermYCond(_ sender: UIButton) {
        Utils.abrirPDF(Constants.PDFS.terminos,self,Constants.PDFViewController.terminos)
    }
    
    


}
