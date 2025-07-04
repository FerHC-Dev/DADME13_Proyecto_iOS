import UIKit
import WebKit

class TarifasViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Constants.moduleName.tariffs
        
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        activityIndicator.style = .large
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        
        if isConnected {
            if let url = URL(string: "https://google.com.mx"){
                webView.load(URLRequest(url: url))
            }
        }else{
            print("Connection not available")
            //Load local page
            /*
            if let filePath = Bundle.main.path(forResource: "Offline", ofType: "html") {
                let localURL = URL(fileURLWithPath: filePath)
                webView.loadFileURL(localURL, allowingReadAccessTo: localURL)
            }*/
        }
    }
    
    func webView(_ webView:WKWebView, didFinish navigation : WKNavigation!){
        activityIndicator.stopAnimating( )
        activityIndicator.isHidden = true
        
    }

    

}
