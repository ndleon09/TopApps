//
//  App.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class App: Object
{
    dynamic var id: Int = 0
    dynamic var name: String?
    dynamic var category: String?
    dynamic var image: String?
    dynamic var summary: String?
    
    convenience init(json: JSON)
    {
        self.init()
        
        id = json["id"]["attributes"]["im:id"].intValue
        name = json["im:name"]["label"].stringValue
        category = json["category"]["attributes"]["label"].stringValue
        image = json["im:image"].array?.last!["label"].stringValue
        summary = json["summary"]["label"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}