//
//  BaseVC.swift
//  iLife
//
//  Created by peigen on 14-6-27.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

import Foundation
import UIKit

class BaseVC:UIViewController {
	var table : UITableView?
	
	let space : CGFloat = 20
	let scrollViewHeight : CGFloat = ICON_HEIGHT + VIEW_TITLE
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var version:NSString = UIDevice.currentDevice().systemVersion
		var f:Float = version.floatValue
		if(f >= 7.0)
		{
			self.edgesForExtendedLayout = UIRectEdge.None;
			self.extendedLayoutIncludesOpaqueBars = false;
			self.modalPresentationCapturesStatusBarAppearance = false;
			self.navigationController.navigationBar.translucent = false;
			//self.tabBarController.tabBar.translucent = false;
		}
		self.wantsFullScreenLayout = true;
		self.view.backgroundColor = UIColor.whiteColor();
	}
	
	//增加表格
	func addTableView()
	{
		addTableView(UITableViewStyle.Plain);
	}
	
	func addTableView(style:UITableViewStyle)
	{
		
		table = UITableView(frame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT),style:style)
		table!.showsVerticalScrollIndicator = false;
		table!.indicatorStyle = UIScrollViewIndicatorStyle.Default;
		table!.backgroundView = nil;
		table!.backgroundColor = UIColor.clearColor();
		table!.backgroundColor = RGBCOLOR.fColor(255,255,255);
		self.view.addSubview(table);
	}
	
	//加载storyboard
	func storyBoardController(string:String) -> BaseVC
	{
		var storyBoard = UIStoryboard(name: "Main",bundle:nil)
		var controller  = storyBoard.instantiateViewControllerWithIdentifier(string) as BaseVC
		return controller
	}
	
	//左导航
	func customizeLeftBarItemWithTarget(target: AnyObject?, action: Selector, imgNormal:UIImage,imgHightlight:UIImage)
	{
		var btn = UIButton.buttonWithType(UIButtonType.Custom) as UIButton;
		btn.setBackgroundImage(imgNormal, forState: UIControlState.Normal)
		btn.setBackgroundImage(imgHightlight, forState: UIControlState.Highlighted)
		btn.frame = CGRectMake(0, 0, imgNormal.size.width, imgNormal.size.height);
		btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
		var barButtonItem = UIBarButtonItem(customView: btn)
		self.navigationItem.leftBarButtonItem = barButtonItem
		
	}
	
	//右导航
	func customizeRightBarItemWithTarget(target: AnyObject?, action: Selector, imgNormal:UIImage,imgHightlight:UIImage)
	{
		var btn = UIButton.buttonWithType(UIButtonType.Custom) as UIButton;
		btn.setBackgroundImage(imgNormal, forState: UIControlState.Normal)
		btn.setBackgroundImage(imgHightlight, forState: UIControlState.Highlighted)
		btn.frame = CGRectMake(0, 0, imgNormal.size.width, imgNormal.size.height);
		btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
		btn.font = UIFont.systemFontOfSize(13);
		var barButtonItem = UIBarButtonItem(customView: btn)
		self.navigationItem.rightBarButtonItem = barButtonItem
	}
	
	//导航标题
	func customizeCenterBarItem(string:String)
	{
		var labTitle = UILabel(frame:CGRectMake(0, 0, 29, 31)) as UILabel
		labTitle.text = string
		labTitle.font = UIFont.boldSystemFontOfSize(22)
		labTitle.textColor = UIColor.whiteColor()
		labTitle.backgroundColor = UIColor.clearColor()
		self.navigationItem.titleView = labTitle;
	}
	
	func leftButtonPress(sender:AnyObject?)
	{
		popSelf();
	}
	
	func rightButtonPress(sender:AnyObject?)
	{
	}
	
	//返回上一级
	func popSelf()
	{
		self.navigationController.popViewControllerAnimated(true);
	}
	
	//返回指定页面
	func popSelf(controller:UIViewController)
	{
		self.navigationController.popToViewController(controller,animated: true)
	}
	
	//提示框
	func YJAlertView(title:NSString,msg:NSString)
	{
		YJAlertView(title, msg: msg, cancel: "取消", other:"确定")
	}
	
	func YJAlertView(title:NSString,msg:NSString,cancel:NSString,other:NSString)
	{
		var alert = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: cancel)
		alert.show()
		
	}

}