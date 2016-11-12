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
        
        emptyView.isHidden = true
        
        super.viewDidLoad()
    }
    
    func showEmptyCase()
    {
        emptyView.isHidden = false
    }
    
    func openAppDetailScreen(_ appDetailViewController: UIViewController)
    {
        appDetailViewController.modalPresentationStyle = .popover
        appDetailViewController.preferredContentSize = CGSize(width: (view.bounds).width / 2, height: 350)
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            appDetailViewController.view.backgroundColor = UIColor.clear
            let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.extraLight))
            blurView.frame = appDetailViewController.view.bounds
            appDetailViewController.view.insertSubview(blurView, at: 0)
        }
        
        let popoverController = appDetailViewController.popoverPresentationController
        popoverController?.backgroundColor = UIColor.clear
        popoverController?.permittedArrowDirections = .any
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRect(x: (view.bounds).width / 2, y: 0, width: 1, height: 1)
        
        present(appDetailViewController, animated: true, completion: nil)
    }
}
