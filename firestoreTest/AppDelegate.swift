//
//  AppDelegate.swift
//  firestoreTest
//
//  Created by Boshi on 2019/7/12.
//  Copyright © 2019 Boshi. All rights reserved.
//

import UIKit

import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        return true
    }



}

