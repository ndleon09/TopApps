//
//  AppsCollectionViewNavigationDelegate.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import BothamUI
import UIKit

public class AppsCollectionViewNavigationDelegate<T: BothamViewDataSource, U: BothamNavigationPresenter where T.ItemType == U.ItemType>: NSObject, UICollectionViewDelegate
{
    private let dataSource: T
    private let presenter: U
    
    public init(dataSource: T, presenter: U)
    {
        self.dataSource = dataSource
        self.presenter = presenter
    }
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let item = dataSource.itemAtIndexPath(indexPath)
        presenter.itemWasTapped(item)
    }
}