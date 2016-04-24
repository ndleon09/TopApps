//
//  ViewController.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import UIKit
import BothamUI

class TopAppsViewController: BothamViewController, BothamLoadingViewController {

    let loadingView: UIView = {
        let loadingView = BothamLoadingView()
        loadingView.color = UIColor.loadingColor
        return loadingView
    }()
}

