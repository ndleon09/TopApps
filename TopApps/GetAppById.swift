//
//  GetAppById.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol GetAppById
{
    func execute(appid: Int, completion: (App?) -> ())
}

class GetAppByIdImp: GetAppById
{
    private let repository: AppsRepository
    
    init(repository: AppsRepository)
    {
        self.repository = repository
    }
    
    func execute(appid: Int, completion: (App?) -> ())
    {
        self.repository.getAppById(appid) { app in
            completion(app)
        }
    }
}