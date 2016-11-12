//
//  Persistence.swift
//  TopApps
//
//  Created by Nelson Dominguez on 01/07/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import RealmSwift

protocol PersistenceLayerProtocol: class {
    
    func fetchApps() -> Results<App>
    func save(apps: [App])
}

class PersistenceLayer: PersistenceLayerProtocol {
    
    fileprivate let real: Realm!
    
    init() {
        real = try! Realm()
    }
    
    func fetchApps() -> Results<App> {
        return real.objects(App.self)
    }
    
    func save(apps: [App]) {
        try! real.write {
            real.add(apps, update: true)
        }
    }
}
