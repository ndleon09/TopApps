//
//  AppCollectionViewCell.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import BothamUI
import AlamofireImage

class AppCollectionViewCell: UICollectionViewCell, BothamViewCell
{
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    func configureForItem(item: App)
    {
        let size: CGSize = CGSizeMake(50.0, 50.0)
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: radius)
        let placeholder = UIImage(named: "placeholder")?.af_imageScaledToSize(size).af_imageWithRoundedCornerRadius(radius)
        
        if let image = item.image {
            appIconImageView.af_setImageWithURL(NSURL(string: image)!, placeholderImage: placeholder, filter: filter)
        } else {
            appIconImageView.image = placeholder
        }
        
        appNameLabel?.text = item.name
    }
}