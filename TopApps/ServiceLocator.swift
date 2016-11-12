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
    fileprivate lazy var storyBoard: BothamStoryboard = {
        return BothamStoryboard(name: "Main")
    }()
    
    func rootViewController() -> UIViewController
    {
        let navigationController: UINavigationController = storyBoard.initialViewController()
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
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
    
    fileprivate func appsPresenter(_ viewController: AppsUI) -> AppsPresenterImp
    {
        let persistence = PersistenceLayer()
        let getTopApps = GetTopAppsImp(repository: AppsRepositoryImp(persistence: persistence))
        return AppsPresenterImp(ui: viewController, getTopApps: getTopApps)
    }
    
    fileprivate func appsListDataSource() -> BothamTableViewDataSource<App, AppTableViewCell> {
        return BothamTableViewDataSource<App, AppTableViewCell>()
    }
    
    fileprivate func appsCollectionDataSource() -> BothamCollectionViewDataSource<App, AppCollectionViewCell> {
        return BothamCollectionViewDataSource<App, AppCollectionViewCell>()
    }
    
    // MARK: DetailTopApps
    
    func appDetailViewController(_ appId: Int, appName: String) -> UIViewController
    {
        let appDetailViewController: AppDetailViewController = storyBoard.instantiateViewController("AppDetailViewController")
        let presenter = appDetailPresenter(appDetailViewController, appId: appId, appName: appName)
        appDetailViewController.presenter = presenter
        return appDetailViewController
    }
    
    fileprivate func appDetailPresenter(_ ui: AppDetailUI, appId: Int, appName: String) -> AppDetailPresenterImp
    {
        let persistence = PersistenceLayer()
        let getAppById = GetAppByIdImp(repository: AppsRepositoryImp(persistence: persistence))
        return AppDetailPresenterImp(ui: ui, getAppById: getAppById, appId: appId, appName: appName)
    }
}
