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
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension App {
    
    static func build(json: JSON) -> App {
    
        let app = App()
        app.id = json["id"]["attributes"]["im:id"].intValue
        app.name = json["im:name"]["label"].stringValue
        app.category = json["category"]["attributes"]["label"].stringValue
        app.image = json["im:image"].array?.last!["label"].stringValue
        app.summary = json["summary"]["label"].stringValue
        
        return app
    }
}
