//
//  AppsViewControollerTests.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import KIF
import Nimble
import UIKit
@testable import TopApps

class AppsViewControollerTestsUI: AcceptanceTestCase
{
    private let repository = AppsTestRepository()
    
    func testShowsTheExactNumberOfApps()
    {
        let repository = givenThereAreSomeApps()
        
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openAppsListViewController()
            let tableView = tester().waitForViewWithAccessibilityLabel("ListAppsTableView") as! UITableView
            expect(tableView.numberOfRowsInSection(0)).to(equal(repository.count))
        }
        else {
            openAppsCollectionViewController()
            let collectionView = tester().waitForViewWithAccessibilityLabel("AppsCollectionView") as! UICollectionView
            expect(collectionView.numberOfItemsInSection(0)).to(equal(repository.count))
        }
    }
    
    func testShowsAppNamesIfThereAreApps()
    {
        let repository = givenThereAreSomeApps()
        
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            
            openAppsListViewController()
            
            for i in 0..<repository.count {
                let app = repository[i]
                let cell = tester().waitForViewWithAccessibilityLabel("\(app.id)-Identifier") as! AppTableViewCell
                expect(cell.textLabel?.text).to(equal(app.name))
            }
        }
        else {
            openAppsCollectionViewController()
            
            for i in 0..<repository.count {
                let app = repository[i]
                let appNameLabel = tester().waitForViewWithAccessibilityLabel(app.name) as! UILabel
                expect(appNameLabel.text).to(equal(app.name))
            }
        }
    }
    
    private func givenThereAreSomeApps(numberOfApps: Int = 10) -> [App]
    {
        var apps = [App]()
        for i in 0..<numberOfApps {
            let app = App(id: i, name: "App \(i)", category: "Games", image: "http://www.image.com", description: "Description for App \(i)")
            apps.append(app)
        }
        repository.apps = apps
        return apps
    }
    
    private func openAppsListViewController()
    {
        let appsViewController = ServiceLocator().appsListViewController() as! ListAppsViewController
        appsViewController.presenter = AppsPresenterImp(ui: appsViewController, getTopApps: GetTopAppsImp(repository: repository))
        
        let rootViewController = UINavigationController(rootViewController: appsViewController)
        presentViewController(rootViewController)
        
        tester().waitForAnimationsToFinish()
    }
    
    private func openAppsCollectionViewController()
    {
        let appsViewController = ServiceLocator().appsCollectionViewController() as! AppsCollectionViewController
        appsViewController.presenter = AppsPresenterImp(ui: appsViewController, getTopApps: GetTopAppsImp(repository: repository))
        
        let rootViewController = UINavigationController(rootViewController: appsViewController)
        presentViewController(rootViewController)
        
        tester().waitForAnimationsToFinish()
    }
}