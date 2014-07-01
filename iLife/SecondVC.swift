//
//  SecondVC.swift
//  CleanUp
//
//  Created by peigen on 14-6-21.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

import Foundation
import UIKit

class SecondVC: BaseVC {
	// UIView
	@IBOutlet var usedToScrollView: UIScrollView
	@IBOutlet var appScrollView: UIScrollView
	@IBOutlet var callScrollView: UIScrollView
	@IBOutlet var unkownScrollView: UIScrollView
	
	// UIViewController
	
	
	var appImges : Array<String> = ["com_sina_weibo_icon.png","com_tencent_mm_icon.png","com_eg_android_AlipayGphone_icon.png","com_android_chrome_icon.png","com_youku_phone_icon.png"]
	
	var iphoneCalls : Array<String> = ["IMG_0883.JPG"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var background : UIImage = UIImage(named:"bookshelf.png")
		UIGraphicsBeginImageContext(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-64));
		background.drawInRect(CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64))
		background = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
//		background.resizableImageWithCapInsets(background.capInsets, resizingMode: UIImageResizingMode.Stretch)
//			= CGSize(SCREEN_WIDTH,SCREEN_HEIGHT)
		self.view.backgroundColor = UIColor(patternImage: background)
		initView()
		initButton()
	}
	
	func setScrollView(scrollView : UIScrollView, yAxis : CGFloat) {

		scrollView.frame = CGRectMake( ORIGINAL_POINT, yAxis, SCREEN_WIDTH, scrollViewHeight)
		scrollView.contentSize = CGSize(width: SCREEN_WIDTH*2, height: scrollViewHeight)
//		scrollView.backgroundColor = backgroundColor
		scrollView.pagingEnabled = false
		scrollView.bounces = true
	}
	
	func initView(){
		self.view.frame = CGRectMake(ORIGINAL_POINT, ORIGINAL_POINT, SCREEN_WIDTH, SCREEN_HEIGHT)
		// 0. used to
		var usedToYAxis = space
		setScrollView(usedToScrollView, yAxis: usedToYAxis)
		
		// 1. app view
		var appYAxis = usedToYAxis + scrollViewHeight
		setScrollView(appScrollView, yAxis: appYAxis)
		
		// 2. call view
		var callYAxis = appYAxis + scrollViewHeight
		setScrollView(callScrollView, yAxis: callYAxis)

		// 3. unkown view
		var unkownYAxis = callYAxis + scrollViewHeight
		setScrollView(unkownScrollView, yAxis: unkownYAxis)
		
	}
	
	func initButton(){
		var x = 30
		for i in 0..4{
			
			// title
			initLabel(usedToScrollView, text: "App Manage", align: NSTextAlignment.Center)
			// more
			
			// button
			var button = UIButton.buttonWithType(.Custom) as UIButton
			
			button.frame = CGRect(x: x ,y: 40,width: 57,height: 57)
			
			button.setImage(UIImage(named:appImges[i]),forState: .Normal)
			button.addTarget(self, action: "onAction:", forControlEvents: .TouchUpInside)
			//		button.tag = i
			addScrollView(button)
			x += 57+10;
		}
		
	}
	
	func initButton(i:Int,x:Int) {

		
//		
//		initLabel(usedToScrollView, text: <#String#>, align: <#NSTextAlignment#>)
	}
	
	func initLabel(view : UIView , text : String ,align : NSTextAlignment){
		// title
		var titleLabel : UILabel = UILabel(frame:CGRect(origin: CGPointMake(0.0, 0.0), size: CGSizeMake(150,20)))
		titleLabel.textAlignment = align
		titleLabel.text = text
		titleLabel.textColor = UIColor.redColor()
		view.addSubview(titleLabel)
	}
	
	func addScrollView(button : UIButton){
		usedToScrollView.addSubview(button)
//		appScrollView.addSubview(button)
//		callScrollView.addSubview(button)
//		unkownScrollView.addSubview(button)
	}
	
	func onAction(btn:UIButton)
	{
		if(btn.tag == 0)
		{
			openWeiboAction(btn)
		}
		
		if(btn.tag == 1)
		{
			openWeixinAction(btn)
		}
		
		if(btn.tag == 2)
		{
			openAlipayAction(btn)
		}
		
		if(btn.tag == 3)
		{
			openChromeAction(btn)
		}
		
		if(btn.tag == 4)
		{
			openYoukuAction(btn)
		}
	}
	
	func openWeiboAction(sender: UIButton) {
		UIApplication.sharedApplication().openURL(NSURL(string: "weibo://"))
	}
	
	func openWeixinAction(sender: UIButton) {
		UIApplication.sharedApplication().openURL(NSURL(string: "weixin://"))
	}
	
	func openAlipayAction(sender: UIButton) {
		UIApplication.sharedApplication().openURL(NSURL(string: "alipays://"))
	}
	
	func openChromeAction(sender: UIButton) {
		UIApplication.sharedApplication().openURL(NSURL(string: "googlechrome://"))
	}
	
	func openYoukuAction(sender: UIButton) {
		UIApplication.sharedApplication().openURL(NSURL(string: "YouKu://"))
	}
	
	func callYayaAction(sender: UIButton) {
		UIApplication.sharedApplication().openURL(NSURL(string: "tel:18629091151"))
	}

}