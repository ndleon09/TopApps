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
    
    func configure(forItem item: App) {
        
        let size: CGSize = CGSize(width: 50.0, height: 50.0)
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: radius)
        let placeholder = UIImage(named: "placeholder")?.af_imageScaled(to: size).af_imageRounded(withCornerRadius: radius)
        
        if let image = item.image {
            appIconImageView.af_setImage(withURL: URL(string: image)!, placeholderImage: placeholder, filter: filter, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.4), runImageTransitionIfCached: false, completion: nil)
        } else {
            appIconImageView.image = placeholder
        }
        
        appNameLabel?.text = item.name
    }
}
