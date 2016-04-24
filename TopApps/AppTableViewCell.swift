//
//  AppTableViewCell.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import AlamofireImage

class AppTableViewCell: UITableViewCell, BothamViewCell
{
    func configureForItem(item: App)
    {
        let size: CGSize = CGSizeMake(50.0, 50.0)
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: size,
            radius: radius
        )
        let placeholder = UIImage(named: "placeholder")?.af_imageScaledToSize(size).af_imageWithRoundedCornerRadius(radius)
        
        imageView?.af_setImageWithURL(NSURL(string: item.image)!, placeholderImage: placeholder, filter: filter)
        
        textLabel?.text = item.name
        
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.text = item.category
        
        accessibilityLabel = "\(item.id)-Identifier"
    }
}
