//
//  AppsCollectionViewController.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class AppsCollectionViewController: TopAppsViewController, BothamCollectionViewController, AppsUI, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyView: UILabel!
    
    var dataSource: BothamCollectionViewDataSource<App, AppCollectionViewCell>!
    var delegate: UICollectionViewDelegate!
    
    override func viewDidLoad()
    {
        title = "Top Apps"
        
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.accessibilityLabel = "AppsCollectionView"
        
        emptyView.hidden = true
        
        super.viewDidLoad()
    }
    
    func showEmptyCase()
    {
        emptyView.hidden = false
    }
    
    func openAppDetailScreen(appDetailViewController: UIViewController)
    {
        appDetailViewController.modalPresentationStyle = .Popover
        appDetailViewController.preferredContentSize = CGSizeMake(CGRectGetWidth(view.bounds) / 2, 350)
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            appDetailViewController.view.backgroundColor = UIColor.clearColor()
            let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.ExtraLight))
            blurView.frame = appDetailViewController.view.bounds
            appDetailViewController.view.insertSubview(blurView, atIndex: 0)
        }
        
        let popoverController = appDetailViewController.popoverPresentationController
        popoverController?.backgroundColor = UIColor.clearColor()
        popoverController?.permittedArrowDirections = .Any
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRectMake(CGRectGetWidth(view.bounds) / 2, 0, 1, 1)
        
        presentViewController(appDetailViewController, animated: true, completion: nil)
    }
}