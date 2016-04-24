//
//  AppsPresenter.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class AppsPresenter: BothamPresenter, BothamNavigationPresenter
{
    // UserInterface
    private weak var ui: AppsUI?
    
    // UseCase
    private let getTopApps: GetTopApps
    
    init(ui: AppsUI, getTopApps: GetTopApps)
    {
        self.ui = ui
        self.getTopApps = getTopApps
    }
    
    func viewDidLoad()
    {
        ui?.showLoader()
        getTopApps.execute { apps in
            self.ui?.hideLoader()
            if apps.isEmpty {
                self.ui?.showEmptyCase()
            }
            else {
                self.ui?.showItems(apps)
            }
        }
    }
    
    func itemWasTapped(item: App)
    {
        let appDetailViewController = ServiceLocator().appDetailViewController(item.id, appName: item.name)
        ui?.openAppDetailScreen(appDetailViewController)
    }
}

protocol AppsUI: BothamUI, BothamLoadingUI
{
    func showEmptyCase()
    func showItems(items: [App])
    func openAppDetailScreen(appDetailViewController: UIViewController)
}