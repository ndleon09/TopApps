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

open class AppsCollectionViewNavigationDelegate<T: BothamViewDataSource, U: BothamNavigationPresenter>: NSObject, UICollectionViewDelegate where T.ItemType == U.ItemType
{
    fileprivate let dataSource: T
    fileprivate let presenter: U
    
    public init(dataSource: T, presenter: U)
    {
        self.dataSource = dataSource
        self.presenter = presenter
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let item = dataSource.item(at: indexPath)
        presenter.itemWasTapped(item)
    }
}
