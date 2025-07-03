import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tvNotices: UITableView!
    
    var arrayNotices: [Notice] = [Notice(id:1,title:"Notice1",image:"",date:"12/12/2025",detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ,Notice(id:2,title:"Notice2",image:"",date:"12/12/2025",detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ,Notice(id:3,title:"Notice3",image:"",date:"12/12/2025",detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ,Notice(id:4,title:"Notice4",image:"",date:"12/12/2025",detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = Constants.moduleName.home
        // Do any additional setup after loading the view.
        
        tvNotices.dataSource = self
        tvNotices.delegate = self
        tvNotices.showsHorizontalScrollIndicator = true
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, NoticeCell.NoticeDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNotices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticeCell
        let notice = arrayNotices[indexPath.row]
        cell.delegate = self
        cell.tvNoticeTitle.text = notice.title.localizedCapitalized
        cell.tvNoticeDate.text = notice.date.localizedCapitalized
        cell.tvNoticeImage.image = UIImage(named: "temp")
        return cell
    }
    
    func showNoticeDetail(_ celda: NoticeCell) {
        guard let indexPath = tvNotices.indexPath(for: celda) else { return }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let showDetailNotice = sb.instantiateViewController(identifier: "idNoticeDetail") as? NoticeDetailViewController {

            showDetailNotice.notice = arrayNotices[indexPath.row]
            
            navigationController?.pushViewController(showDetailNotice, animated: true)
        }
        
        
        
        
    }
}
