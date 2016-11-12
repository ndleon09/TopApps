//
//  AppsTestRepository.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
@testable import TopApps

class AppsTestRepository: AppsRepositoryImp
{
    override init(persistence: PersistenceLayerProtocol) {
        
        super.init(persistence: persistence)
        
        if apps.count == 0 {
            
            var apps = [App]()
            for i in 1 ... 15 {
                let app = App(value: ["id": i, "name": "App \(i)", "category": "Category", "summary": "Summary for App \(i)"])
                apps.append(app)
            }
            persistenceLayer.save(apps: apps)
        }
    }
    
    override func getAll(completion: @escaping ([App]) -> ()) {
        let result = Array(apps)
        completion(result)
    }
}
