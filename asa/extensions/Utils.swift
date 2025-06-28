import UIKit
import PDFKit

struct Utils {
    
    static func showAlert(_ title: String,_ message: String,_ view: UIViewController){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.Titles.ok, style: .default){
            alertaction in
        }
        ac.addAction(action)
        view.present(ac,animated: true)
    }
    
    static func abrirPDF(_ pdfName: String,_ view: UIViewController,_ title:String) {
        guard let url = Bundle.main.url(forResource: pdfName, withExtension: nil) else {
            showAlert(Constants.Titles.error, Constants.Titles.pdfNotFound, view)
            return
        }
        
        let pdfViewController = UIViewController()
        let pdfView = PDFView(frame: pdfViewController.view.bounds)
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        pdfView.autoScales = true
        pdfView.document = PDFDocument(url: url)
        
        pdfViewController.view.addSubview(pdfView)
        NSLayoutConstraint.activate([
            pdfView.leadingAnchor.constraint(equalTo: pdfViewController.view.leadingAnchor),
            pdfView.trailingAnchor.constraint(equalTo: pdfViewController.view.trailingAnchor),
            pdfView.topAnchor.constraint(equalTo: pdfViewController.view.topAnchor),
            pdfView.bottomAnchor.constraint(equalTo: pdfViewController.view.bottomAnchor)
        ])
        
        pdfViewController.title = title
        view.navigationController?.pushViewController(pdfViewController, animated: true)
    }
    
}
