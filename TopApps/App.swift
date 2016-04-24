//
//  App.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import Gloss

struct App: Decodable
{
    var id: Int
    var name: String
    var category: String
    var image: String
    var description: String?
    
    init?(json: JSON)
    {
        guard let idJSON: JSON = "id.attributes" <~~ json,
        nameJSON: JSON = "im:name" <~~ json,
        categoryJSON: JSON = "category.attributes" <~~ json,
        imagesJSON: [JSON] = "im:image" <~~ json,
        summaryJSON: JSON = "summary" <~~ json
        else { return nil }
        
        guard let id: String = "im:id" <~~ idJSON,
        name: String = "label" <~~ nameJSON,
        category: String = "label" <~~ categoryJSON,
        image: String = "label" <~~ imagesJSON.last!,
        description: String = "label" <~~ summaryJSON
        else { return nil }
        
        self.id = Int(id)!
        self.name = name
        self.category = category
        self.image = image
        self.description = description
    }
    
    init(id: Int, name: String, category: String, image: String, description: String)
    {
        self.id = id
        self.name = name
        self.category = category
        self.image = image
        self.description = description
    }
}