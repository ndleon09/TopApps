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
        
        emptyView.hidden = true
        
        configureNavigationBarBackButton()
        
        super.viewDidLoad()
    }
    
    func showEmptyCase()
    {
        emptyView.hidden = false
    }
    
    func openAppDetailScreen(appDetailViewController: UIViewController)
    {
        navigationController?.push(appDetailViewController)
    }
    
    private func configureNavigationBarBackButton()
    {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
    }
}
