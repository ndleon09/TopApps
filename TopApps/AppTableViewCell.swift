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
    
    func configure(forItem item: App) {
        
        let size: CGSize = CGSize(width: 50.0, height: 50.0)
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: radius)
        let placeholder = UIImage(named: "placeholder")?.af_imageAspectScaled(toFit: size).af_imageRounded(withCornerRadius: radius)
        
        if let image = item.image {
            imageView?.af_setImage(withURL: URL(string: image)!, placeholderImage: placeholder, filter: filter, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.4), runImageTransitionIfCached: false, completion: nil)
        } else {
            imageView?.image = placeholder
        }
        
        textLabel?.text = item.name
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.text = item.category
        
        accessibilityLabel = "\(item.id)-Identifier"
    }
}
