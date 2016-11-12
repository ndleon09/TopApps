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
    
    fileprivate var originalRootViewController: UIViewController?
    fileprivate var rootViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        
        set(newRootViewController) {
            UIApplication.shared.keyWindow?.rootViewController = newRootViewController
        }
    }
    
    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }
    
    func presentViewController(_ viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
}
