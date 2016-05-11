//
//  AppsRepository.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import Alamofire

protocol AppsRepository
{
    func getAll(completion: ([App]) -> ())
    func getAppById(appid: Int, completion: (App?) -> ())
}

class AppsRepositoryImp: AppsRepository
{
    static let sharedRepository = AppsRepositoryImp()
    
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