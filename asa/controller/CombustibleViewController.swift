//
//  CombustibleViewController.swift
//  asa
//
//  Created by Fernando Hernández on 28/06/25.
//

import UIKit

class CombustibleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaberMas(_ sender: UIButton) {
        Utils.abrirPDF(Constants.PDFS.combustibles,self,Constants.PDFViewController.combustibles)
    }
    

}
