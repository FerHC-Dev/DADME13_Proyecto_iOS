//
//  TableViewController.swift
//  asa
//
//  Created by Fernando Hernández on 08/05/25.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            if let navigationController = self.navigationController {
                let destinoVC = storyboard?.instantiateViewController(withIdentifier: "HomeView")
                navigationController.pushViewController(destinoVC!, animated: true)
            } else {
                print("Error: El controlador no está dentro de un UINavigationController.")
            }
        case 1:
            if let navigationController = self.navigationController {
                let destinoVC = storyboard?.instantiateViewController(withIdentifier: "ServicesSegue")
                navigationController.pushViewController(destinoVC!, animated: true)
            } else {
                print("Error: El controlador no está dentro de un UINavigationController.")
            }
        default:
            break
        }
        
    }


}
