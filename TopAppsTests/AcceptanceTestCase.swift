//
//  TopAppsTests.swift
//  TopAppsTests
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import KIF

class AcceptanceTestCase: KIFTestCase {
    
    private var originalRootViewController: UIViewController?
    private var rootViewController: UIViewController? {
        get {
            return UIApplication.sharedApplication().keyWindow?.rootViewController
        }
        
        set(newRootViewController) {
            UIApplication.sharedApplication().keyWindow?.rootViewController = newRootViewController
        }
    }
    
    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }
    
    func presentViewController(viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
}
