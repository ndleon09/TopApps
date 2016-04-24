//
//  AppsRepository.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import Alamofire

class AppsRepository
{
    static let sharedRepository = AppsRepository()
    
    private var apps: [App] = []
    
    func getAll(completion: ([App]) -> ())
    {
        apps.removeAll()
        
        Alamofire.request(.GET, "https://itunes.apple.com/us/rss/topfreeapplications/limit=30/json").responseJSON { response in
            
            if let JSON = response.result.value {
                
                for json: [String: AnyObject] in JSON.valueForKeyPath("feed.entry") as! Array {
                    if let app = App(json: json) {
                        self.apps.append(app)
                    }
                }
                
                completion(self.apps)
            }
            else {
                completion([])
            }
        }
    }
    
    func getAppById(appid: Int, completion: (App?) -> ())
    {
        let app = self.apps.filter { $0.id == appid }.first
        completion(app)
    }
}