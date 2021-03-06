//
//  AppsRepository.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

protocol AppsRepository {
    
    func getAll(completion: @escaping ([App]) -> ())
    func getAppById(appid: Int) -> App?
}

class AppsRepositoryImp: AppsRepository {
    
    var persistenceLayer: PersistenceLayerProtocol
    var apps: Results<App>
    
    init(persistence: PersistenceLayerProtocol) {
        
        persistenceLayer = persistence
        apps = persistenceLayer.fetchApps()
    }
    
    func getAll(completion: @escaping ([App]) -> ()) {
        
        let result = Array(apps)
        completion(result)
        
        Alamofire.request("https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json").responseJSON { response in
            
            if let responseValue = response.result.value {
                if let entry = JSON(responseValue)["feed"]["entry"].array {
                    
                    let apps: [App] = entry.map { App.build(json: $0) }
                    self.persistenceLayer.save(apps: apps)
                    completion(apps)
                }
            }
        }
    }
    
    func getAppById(appid: Int) -> App? {
        let app = self.apps.filter("id = \(appid)").first
        return app
    }
}
