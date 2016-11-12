//
//  AppDetailPresenter.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import BothamUI

protocol AppDetailPresenter: BothamPresenter { }

class AppDetailPresenterImp: AppDetailPresenter {
    
    // UserInterface
    fileprivate weak var ui: AppDetailUI?
    
    // App data
    fileprivate let appId: Int
    fileprivate let appName: String
    
    // UseCase
    fileprivate let getAppById: GetAppById
    
    init(ui: AppDetailUI, getAppById: GetAppById, appId: Int, appName: String) {
        self.ui = ui
        self.getAppById = getAppById
        self.appId = appId
        self.appName = appName
    }
    
    func viewDidLoad() {
        
        ui?.title = appName
        let app = getAppById.execute(appid: appId)
        self.ui?.show(app: app)
    }
}

protocol AppDetailUI: BothamUI {
    
    // Title of view
    var title: String? {get set}
    
    // Show app information
    func show(app: App?)
}
