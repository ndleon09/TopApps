//
//  ListAppsViewController.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import UIKit
import BothamUI

class ListAppsViewController: TopAppsViewController, BothamTableViewController, AppsUI {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UILabel!
    
    var dataSource: BothamTableViewDataSource<App, AppTableViewCell>!
    var delegate: UITableViewDelegate!
    
    override func viewDidLoad()
    {
        title = "Top Apps"

        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.tableFooterView = UIView()
        tableView.accessibilityLabel = "ListAppsTableView"
        
        emptyView.isHidden = true
        
        configureNavigationBarBackButton()
        
        super.viewDidLoad()
    }
    
    func showEmptyCase()
    {
        emptyView.isHidden = false
    }
    
    func openAppDetailScreen(_ appDetailViewController: UIViewController)
    {
        navigationController?.push(viewController: appDetailViewController)
    }
    
    fileprivate func configureNavigationBarBackButton()
    {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}
