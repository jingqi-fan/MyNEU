//
//  NotificationsViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 23/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        // nav bar title
        title = "Notifications"
        
    }

}   // #25
