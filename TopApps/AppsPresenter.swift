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

protocol AppsPresenter: BothamPresenter, BothamNavigationPresenter {
    
}

class AppsPresenterImp: AppsPresenter {
    
    // UserInterface
    fileprivate weak var ui: AppsUI?
    
    // UseCase
    fileprivate let getTopApps: GetTopApps
    
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
            apps.isEmpty ? self.ui?.showEmptyCase() : self.ui?.show(items: apps)
        }
    }
    
    func itemWasTapped(_ item: App)
    {
        let appDetailViewController = ServiceLocator().appDetailViewController(item.id, appName: item.name!)
        ui?.openAppDetailScreen(appDetailViewController)
    }
}

protocol AppsUI: BothamUI, BothamLoadingUI
{
    func showEmptyCase()
    func show(items: [App])
    func openAppDetailScreen(_ appDetailViewController: UIViewController)
}
