//
//  AppDetailViewController.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class AppDetailViewController: TopAppsViewController, AppDetailUI
{
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appCategoryLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UITextView!
    
    func showApp(application: App?)
    {
        guard let app = application else {
            return
        }
        
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: appIconImageView.frame.size,
            radius: radius
        )
        let placeholder = UIImage(named: "placeholder")?.af_imageWithRoundedCornerRadius(radius)
        
        appIconImageView?.af_setImageWithURL(NSURL(string: app.image!)!, placeholderImage: placeholder, filter: filter)
        appNameLabel.text = app.name
        appCategoryLabel.text = app.category
        appDescriptionLabel.text = app.summary
    }
}