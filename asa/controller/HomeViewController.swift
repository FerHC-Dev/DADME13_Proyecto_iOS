import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tvNotices: UITableView!
    
    var arrayNotices: [Notice] = [Notice(id:1,title:"Notice1",image:"",date:"12/12/2025",detail:"")
    ,Notice(id:2,title:"Notice2",image:"",date:"12/12/2025",detail:"")
    ,Notice(id:3,title:"Notice3",image:"",date:"12/12/2025",detail:"")
    ,Notice(id:4,title:"Notice4",image:"",date:"12/12/2025",detail:"")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Inicio"
        // Do any additional setup after loading the view.
        
        tvNotices.dataSource = self
        tvNotices.delegate = self
        tvNotices.showsHorizontalScrollIndicator = true
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNotices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticeCell
        let notice = arrayNotices[indexPath.row]
        
        cell.tvNoticeTitle.text = notice.title.localizedCapitalized
        cell.tvNoticeDate.text = notice.date.localizedCapitalized
        cell.tvNoticeImage.image = UIImage(named: "temp")
        return cell
    }
    
    
}
