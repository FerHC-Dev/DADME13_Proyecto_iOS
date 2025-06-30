//
//  ConsultoriaViewController.swift
//  asa
//
//  Created by Fernando Hernández on 28/06/25.
//

import UIKit

class ConsultoriaViewController: UIViewController {
    
    @IBOutlet weak var tbConsultoria: UITableView!
    
    var arrayConsult: [Service] = [Service(id:1,title:"Consultoria1",image:"",detail:"")
    ,Service(id:2,title:"Consultoria2",image:"",detail:"")
    ,Service(id:3,title:"Consultoria3",image:"",detail:"")
    ,Service(id:4,title:"Consultoria4",image:"",detail:"")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tbConsultoria.dataSource = self
        tbConsultoria.delegate = self
        tbConsultoria.showsHorizontalScrollIndicator = true
    }
    
    @IBAction func btnSaberMas(_ sender: UIButton) {
        Utils.abrirPDF(Constants.PDFS.consultoria,self,Constants.PDFViewController.consultoria)
    }
    
}

extension ConsultoriaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayConsult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellConsult", for: indexPath) as! ConsultoriaCell
        let notice = arrayConsult[indexPath.row]
        
        cell.titleConsultoria.text = notice.title.localizedCapitalized
        cell.imgConsultoria.image = UIImage(named: "temp")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}
