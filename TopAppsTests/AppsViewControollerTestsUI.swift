//
//  AppsViewControollerTests.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import KIF
import Nimble
import RealmSwift
@testable import TopApps

class AppsViewControollerTestsUI: AcceptanceTestCase
{
    private var repository: AppsTestRepository!
    
    override func setUp() {
        
        super.setUp()
        
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        repository = AppsTestRepository(persistence: PersistenceLayer())
    }
    
    func testShowsTheExactNumberOfApps()
    {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            openAppsListViewController()
            let tableView = tester().waitForViewWithAccessibilityLabel("ListAppsTableView") as! UITableView
            expect(tableView.numberOfRowsInSection(0)).to(equal(repository.apps.count))
        }
        else {
            openAppsCollectionViewController()
            let collectionView = tester().waitForViewWithAccessibilityLabel("AppsCollectionView") as! UICollectionView
            expect(collectionView.numberOfItemsInSection(0)).to(equal(repository.apps.count))
        }
    }
    
    func testShowsAppNamesIfThereAreApps()
    {
        if UI_USER_INTERFACE_IDIOM() == .Phone {
            
            openAppsListViewController()
            
            for app in repository.apps {
                let cell = tester().waitForViewWithAccessibilityLabel("\(app.id)-Identifier") as! AppTableViewCell
                expect(cell.textLabel?.text).to(equal(app.name))
            }
        }
        else {
            openAppsCollectionViewController()
            
            for app in repository.apps {
                let appNameLabel = tester().waitForViewWithAccessibilityLabel(app.name) as! UILabel
                expect(appNameLabel.text).to(equal(app.name))
            }
        }
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