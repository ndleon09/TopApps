//
//  ServiceLocator.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class ServiceLocator
{
    private lazy var storyBoard: BothamStoryboard = {
        return BothamStoryboard(name: "Main")
    }()
    
    func rootViewController() -> UIViewController
    {
        let navigationController: UINavigationController = storyBoard.initialViewController()
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad {
            navigationController.viewControllers = [appsCollectionViewController()]
        }
        else {
            navigationController.viewControllers = [appsListViewController()]
        }
        
        return navigationController
    }
    
    // MARK: TopApps
    
    func appsListViewController() -> UIViewController
    {
        let appsViewController: ListAppsViewController = storyBoard.instantiateViewController("AppsViewController")
        let presenter = appsPresenter(appsViewController)
        let datasource = appsListDataSource()
        
        appsViewController.presenter = presenter
        appsViewController.dataSource = datasource
        appsViewController.delegate = BothamTableViewNavigationDelegate(dataSource: datasource, presenter: presenter)
        return appsViewController
    }
    
    func appsCollectionViewController() -> UIViewController
    {
        let appsViewController: AppsCollectionViewController = storyBoard.instantiateViewController("AppsCollectionViewController")
        let presenter = appsPresenter(appsViewController)
        let datasource = appsCollectionDataSource()
        
        appsViewController.presenter = presenter
        appsViewController.dataSource = datasource
        appsViewController.delegate = AppsCollectionViewNavigationDelegate(dataSource: datasource, presenter: presenter)
        return appsViewController
    }
    
    private func appsPresenter(viewController: AppsUI) -> AppsPresenter
    {
        let getTopApps = GetTopApps(repository: AppsRepository.sharedRepository)
        return AppsPresenter(ui: viewController, getTopApps: getTopApps)
    }
    
    private func appsListDataSource() -> BothamTableViewDataSource<App, AppTableViewCell> {
        return BothamTableViewDataSource<App, AppTableViewCell>()
    }
    
    private func appsCollectionDataSource() -> BothamCollectionViewDataSource<App, AppCollectionViewCell> {
        return BothamCollectionViewDataSource<App, AppCollectionViewCell>()
    }
    
    // MARK: DetailTopApps
    
    func appDetailViewController(appId: Int, appName: String) -> UIViewController
    {
        let appDetailViewController: AppDetailViewController = storyBoard.instantiateViewController("AppDetailViewController")
        let presenter = appDetailPresenter(appDetailViewController, appId: appId, appName: appName)
        appDetailViewController.presenter = presenter
        return appDetailViewController
    }
    
    private func appDetailPresenter(ui: AppDetailUI, appId: Int, appName: String) -> AppDetailPresenter
    {
        let getAppById = GetAppById(repository: AppsRepository.sharedRepository)
        return AppDetailPresenter(ui: ui, getAppById: getAppById, appId: appId, appName: appName)
    }
}