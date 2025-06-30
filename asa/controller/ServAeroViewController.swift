import UIKit

class ServAeroViewController: UIViewController {
    
    @IBOutlet weak var tbOperacion: UITableView!
    
    @IBOutlet weak var tbComplementario: UITableView!
    
    var arrayOperacion: [Service] = [Service(id:1,title:"Operacional1",image:"",detail:"")
    ,Service(id:2,title:"Operacional2",image:"",detail:"")
    ,Service(id:3,title:"Operacional3",image:"",detail:"")
    ,Service(id:4,title:"Operacional4",image:"",detail:"")
    ]
    
    var arrayComplementario: [Service] = [Service(id:1,title:"Complementario1",image:"",detail:"")
    ,Service(id:2,title:"Complementario2",image:"",detail:"")
    ,Service(id:3,title:"Complementario3",image:"",detail:"")
    ,Service(id:4,title:"Complementario4",image:"",detail:"")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.moduleName.servAerportes
        // Do any additional setup after loading the view.
        
        tbOperacion.dataSource = self
        tbOperacion.delegate = self
        tbOperacion.showsHorizontalScrollIndicator = true
        
        tbComplementario.dataSource = self
        tbComplementario.delegate = self
        tbComplementario.showsHorizontalScrollIndicator = true
    }

    @IBAction func btnSaberMas(_ sender: UIButton) {
        Utils.abrirPDF(Constants.PDFS.aeropuertos,self,Constants.PDFViewController.aeropuertos)
    }
    
}

extension ServAeroViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbOperacion {
            return arrayOperacion.count
        }else if tableView == tbComplementario {
            return arrayComplementario.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbOperacion {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOp", for: indexPath) as! ServOperacionalCell
            let notice = arrayOperacion[indexPath.row]
            
            cell.titleServOp.text = notice.title.localizedCapitalized
            cell.imgServOp.image = UIImage(named: "temp")
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCom", for: indexPath) as! ServComplementarioCell
            let notice = arrayComplementario[indexPath.row]
            
            cell.titleServCom.text = notice.title.localizedCapitalized
            cell.imgServCom.image = UIImage(named: "temp")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}
