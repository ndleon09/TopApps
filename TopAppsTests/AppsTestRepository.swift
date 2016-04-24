//
//  AppsTestRepository.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
@testable import TopApps

class AppsTestRepository: AppsRepository
{
    var apps = [App]()
    
    override func getAll(completion: ([App]) -> ())
    {
        completion(apps)
    }
    
    override func getAppById(appid: Int, completion: (App?) -> ())
    {
        let app = apps.filter { $0.id == appid }.first
        completion(app)
    }
}