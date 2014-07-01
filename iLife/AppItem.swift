//
//  AppItem.swift
//  iLife
//
//  Created by peigen on 14-6-29.
//  Copyright (c) 2014年 Peigen.info. All rights reserved.
//

import Foundation

class AppItem{
	
	var name: String = ""
	var openURL: String = ""
	var icon : String = ""
	var lastOpenDate : NSDate?
	var openTimes : Int16?
	
	func toString() {
		println("AppItem[name=\(name) , openURL=\(openURL) , icon=\(icon), lastOpenDate=\(lastOpenDate),openTimes=\(openTimes)]")
	}
	
	init(name:String,openURL:String) {
		self.name = name
		self.openURL = openURL
	}
	
	init(name:String,openURL:String,icon:String,lastOpenDate:NSDate?,openTimes:Int16?) {
		self.name = name
		self.openURL = openURL
	}

}