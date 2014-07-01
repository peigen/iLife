//
//  YJGlobals.swift
//  PayPurse
//
//  Created by zq on 14-6-10.
//  Copyright (c) 2014 zq. All rights reserved.
//

import UIKit

//设备屏幕尺寸
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let TOP_BAR : CGFloat = 64
let ICON_HEIGHT : CGFloat = 57
let ICON_WIDTH : CGFloat = 57
let ORIGINAL_POINT : CGFloat = 0
let VIEW_TITLE : CGFloat = 20

//App
let YJApp = UIApplication.sharedApplication().delegate as AppDelegate

//设备版本
let sysVersion:NSString = UIDevice.currentDevice().systemVersion
let isAfterIOS6 : Bool = sysVersion.floatValue >= 6.0
let isAfterIOS7 : Bool = sysVersion.floatValue >= 7.0
let isAfterIOS8 : Bool = sysVersion.floatValue >= 8.0


//color
struct RGBCOLOR
{
    static func fColor(red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor
    {
        return UIColor(red:red/255, green: green/255, blue: blue/255, alpha: 1.0);
    }
    
    static func fColorAlpha(red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha:CGFloat) -> UIColor
    {
        return UIColor(red:red/255, green: green/255, blue: blue/255, alpha: alpha);
    }
    
    static func fColorRGB(rgbValue:UInt32) -> UIColor
    {
        return UIColor(red:CGFloat((rgbValue & 0xFF0000) >> 16)/255, green: CGFloat((rgbValue & 0xFF00) >> 8)/255, blue: CGFloat((rgbValue & 0xFF))/255, alpha: 1.0);
    }
    
    static func fColorRGB(rgbValue:UInt32, _ alpha:CGFloat) -> UIColor
    {
        return UIColor(red:CGFloat((rgbValue & 0xFF0000) >> 16)/255, green: CGFloat((rgbValue & 0xFF00) >> 8)/255, blue: CGFloat((rgbValue & 0xFF))/255, alpha: alpha);
    }
}


//可拉伸的图片
struct Resizable
{
    static func ResizableImage(name:String,_ top:CGFloat,_ left:CGFloat,_ bottom:CGFloat,_ right:CGFloat) -> UIImage
    {
        return UIImage(named:name).resizableImageWithCapInsets(UIEdgeInsetsMake(top,left,bottom,right))
    }
    
    static func ResizableImageWithMode(name:String,_ top:CGFloat,_ left:CGFloat,_ bottom:CGFloat,_ right:CGFloat ,_ mode:UIImageResizingMode) -> UIImage
    {
        return UIImage(named:name).resizableImageWithCapInsets(UIEdgeInsetsMake(top,left,bottom,right),resizingMode:mode)
    }
}

struct sysUrl
{
    static func canOpenURLApp(url:String) -> Bool
    {
        return UIApplication.sharedApplication().canOpenURL(NSURL.URLWithString(url))
    }
    
    static func openURLApp(url:String) -> Bool
    {
        return UIApplication.sharedApplication().openURL(NSURL.URLWithString(url))
    }
    
    static func openURLTel(mobile:String) -> Bool
    {
        return UIApplication.sharedApplication().openURL(NSURL.URLWithString(NSString(format: "tel://%@",mobile)))
    }
}
