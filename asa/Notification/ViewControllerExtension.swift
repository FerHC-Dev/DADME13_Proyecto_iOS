//
//  ViewControllerExtension.swift
//  NetworkMonitor
//
//  Created by Rafael Gonzalez on 16/04/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Create computed properties
    var isConnected: Bool {
        return NetworkMonitor.shared.isConnected
    }
    
    var connectionType: String {
        return NetworkMonitor.shared.currentConnectionType
    }
    
    var isExpensive : Bool {
        return NetworkMonitor.shared.isExpensive
    }
    
    //Suscribes to network change notification    
    func observeConnectionChanges() {
        NotificationCenter.default.addObserver(forName: .networkStatusChanged, object: nil, queue: .main, using: { _ in
            print("-------- Connection changed --------")
            print("isConnected: \(self.isConnected)")
            print("isExpensive: \(self.isExpensive)")
            print("connectionType: \(self.connectionType)")
        } )
    }
    
    
    func removeNetworkObserver() {
        NotificationCenter.default.removeObserver(self, name: .networkStatusChanged, object: nil)
    }
}
