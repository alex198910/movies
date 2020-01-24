//
//  AppDelegate.swift
//  MovieShowtimes
//
//  Created by admin on 16.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        guard let startViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() else { return false }

        let navigationController = UINavigationController(rootViewController: startViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    

}

