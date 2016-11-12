//
//  GetTopApps.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation

protocol GetTopApps {
    func execute(completion: @escaping ([App]) -> ())
}

class GetTopAppsImp: GetTopApps {
    
    fileprivate let repository: AppsRepository
    
    init(repository: AppsRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([App]) -> ()) {
        repository.getAll(completion: completion)
    }
}
