//
//  AppDetailPresenter.swift
//  TopApps
//
//  Created by Nelson Dominguez on 24/04/16.
//  Copyright © 2016 Nelson Dominguez. All rights reserved.
//

import Foundation
import BothamUI

protocol AppDetailPresenter: BothamPresenter
{
    
}

class AppDetailPresenterImp: AppDetailPresenter
{
    // UserInterface
    private weak var ui: AppDetailUI?
    
    // App data
    private let appId: Int
    private let appName: String
    
    // UseCase
    private let getAppById: GetAppById
    
    init(ui: AppDetailUI, getAppById: GetAppById, appId: Int, appName: String)
    {
        self.ui = ui
        self.getAppById = getAppById
        self.appId = appId
        self.appName = appName
    }
    
    func viewDidLoad()
    {
        ui?.title = appName
        
        let app = getAppById.execute(appId)
        self.ui?.showApp(app)
    }
}

protocol AppDetailUI: BothamUI
{
    // Title of view
    var title: String? {get set}
    
    // Show app information
    func showApp(app: App?)
}