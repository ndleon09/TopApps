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
    
    func show(app: App?) {
        
        guard let app = app, let url = app.image else {
            return
        }
        
        let radius: CGFloat = 8.0
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: appIconImageView.frame.size,
            radius: radius
        )
        let placeholder = UIImage(named: "placeholder")?.af_imageRounded(withCornerRadius: radius)
        
        appIconImageView?.af_setImage(withURL: URL(string: url)!, placeholderImage: placeholder, filter: filter, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)
        appNameLabel.text = app.name
        appCategoryLabel.text = app.category
        appDescriptionLabel.text = app.summary
    }
}
