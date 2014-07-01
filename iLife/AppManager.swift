//
//  AppItem.swift
//  iLife
//
//  Created by Peigen on 6/10/14.
//  Copyright (c) 2014 Peigen. All rights reserved.
//

import UIKit

class AppManager: NSObject {
   
    var apps = AppItem[]()
    var persistenceHelper: PersistenceHelper = PersistenceHelper()
    
    init(){
        
        var tempApps:NSArray = persistenceHelper.list("AppItem")
        
        for app:AnyObject in tempApps{
            var appItem = AppItem(name:app.valueForKey("name") as String,openURL:app.valueForKey("openURL") as String)
            apps.append(appItem)
        }
		
    }
    
    
	func addApp(name:String, openURL: String){
		
        var dicApp: Dictionary<String, String> = Dictionary<String,String>()
        
        dicApp["name"] = name
        dicApp["openURL"] = openURL
        
        if(persistenceHelper.save("AppItem", parameters: dicApp)){
			apps.append(AppItem(name: name, openURL:openURL))
        }
    }

    func removeTask(index:Int){
        
        var value:String = apps[index].name
        
        if(persistenceHelper.remove("AppItem", key: "name", value: value)){
            apps.removeAtIndex(index)
        }
    }    
}
