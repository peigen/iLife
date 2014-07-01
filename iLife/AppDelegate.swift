//
//  AppDelegate.swift
//  iLife
//
//  Created by peigen on 14-6-29.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var cleanUpNC : UINavigationController?
	var coreDataHelper : CoreDataHelper = CoreDataHelper()
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
//		self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//		self.window!.backgroundColor = UIColor.whiteColor()
//		self.window!.makeKeyAndVisible()
		
		cleanUpNC = window!.rootViewController as? UINavigationController;
		
		return true
	}
	
	func applicationWillResignActive(application: UIApplication) {
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
		appItem()
	}
	
	func applicationWillTerminate(application: UIApplication) {
//		coreDataHelper.saveContext()
	}
	
	func appItem() {
		var appNames = ["Chrome","Youku","Weixin","Weibo","Alipay"]
		var appOpenURLs = ["googlechrome://","YouKu://","weixin://","weibo://","alipays://"]
		var appMgr:AppManager = AppManager()
		
		for i in 0..5 {
			appMgr.addApp(appNames[i], openURL: appOpenURLs[i])
		}
		
		if(!appMgr.apps.isEmpty){
			for app in appMgr.apps{
				app.toString()
			}
		}
	}
	
	
	
}

