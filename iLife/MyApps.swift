//
//  MyApps.swift
//  iLife
//
//  Created by zq on 14-7-9.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

class MyApps
{
    var _country: String? = nil
    
    func country() -> String
    {
        if (!_country)
        {
            
            _country = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as? String
        }
        return _country!;
    }
    
    func detectAppSchemes(successApp:(NSArray) -> Void,failApp:(NSError) -> Void)
    {
        var path = NSBundle.mainBundle().pathForResource("schemeApps", ofType: "json")
        NSDataReadingOptions.DataReadingMappedIfSafe
        var dataError : NSErrorPointer
        var schemeAppsData = NSData.dataWithContentsOfFile(path, options: .DataReadingMappedIfSafe, error: nil)
        
        var schemeAppsDictionary = NSJSONSerialization.JSONObjectWithData(schemeAppsData, options: .MutableContainers, error: nil) as NSDictionary
 
        var appschemes = Array<NSDictionary>()
        var appIdSuccess = NSMutableArray()
        for scheme : AnyObject in schemeAppsDictionary.allKeys
        {
            var appIds = schemeAppsDictionary.objectForKey(scheme) as NSArray
            var newScheme = scheme as String
            newScheme = "\(scheme)://"
            if(sysUrl.canOpenURLApp(newScheme))
            {
                for appId : AnyObject in appIds
                {
                    if (!appIdSuccess.containsObject(appId))
                    {
                        appIdSuccess.addObject(appId)
                        appschemes += ["scheme":newScheme,"ids":appIds]
                    }
                }
            }
        }
        
        var appString = appIdSuccess.componentsJoinedByString(",")
        
        var urlString = "http://itunes.apple.com/lookup?id=\(appString)&country=\(country())"
        
        var manager :AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        manager.requestSerializer.timeoutInterval = 15;
        manager.responseSerializer.acceptableContentTypes = NSSet(objects:"text/javascript")
        
        manager.POST(urlString, parameters: nil, success:
            {
                operation,responseObject in
                
                var resultDic  = responseObject as NSDictionary
                var resultAy = resultDic.objectForKey("results") as Array<NSDictionary>
                var appsDic = NSMutableArray()
                
                for result in resultAy
                {
                    
                    var trackViewUrl = result.objectForKey("trackViewUrl") as NSString
                    var appId = (((trackViewUrl.componentsSeparatedByString("?") as NSArray).objectAtIndex(0) as NSString).componentsSeparatedByString("id") as NSArray).objectAtIndex(1) as NSString
                    
                    
                    for dic in appschemes
                    {
                        var ids = dic.objectForKey("ids") as NSArray
                        var idsString = ids.componentsJoinedByString(",")
                        
                        if(idsString.hasPrefix(appId))
                        {
                            var newDic = NSMutableDictionary(dictionary:result)
                            var scheme = dic.objectForKey("scheme") as String
                            newDic.setValue(scheme, forKey: "scheme")
                            appsDic.addObject(newDic)
                        }
                        
                    }
                    
                    
                }
                
                successApp(appsDic)
            }
            , failure:
            {
                operation,error in
                failApp(error)
            })
        
        
       
    }
    
   
    
}
