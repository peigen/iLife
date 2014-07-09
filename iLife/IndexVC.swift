
import UIKit
import CoreData
import Foundation
import CFNetwork

class IndexVC: BaseVC,UIAlertViewDelegate,UIScrollViewDelegate {
                            
	@IBOutlet var toUrlInput : UITextField
	@IBOutlet var openButton : UIButton
	@IBOutlet var webView : UIWebView
	@IBOutlet var openBaiduButton : UIButton
	@IBOutlet var openTaobaoButton : UIButton
	@IBOutlet var indexButton : UIButton
	@IBOutlet var nextView : UIButton

	let homePath : String = "http://192.168.1.100:8080"
	var path : String = "http://192.168.1.100:8080"

	let returnKeyType = UIReturnKeyType.Done
	
	@IBAction func nextAction(sender : UIButton) {
		var secondVC = storyBoardController("SecondVC") as SecondVC
		
		navigationController.pushViewController(secondVC, animated: true)
		// self.presentModalViewController(secondVC, animated: true)
	}
	
	@IBAction func onGotoAction(sender : UIButton) {
		path  = "http://" + toUrlInput.text
		println(path)
		webView.loadRequest(NSURLRequest(URL: NSURL(string:path)))
	}
	
	@IBAction func openIndexAction(sender : UIButton) {
		println(homePath)
		webView.loadRequest(NSURLRequest(URL: NSURL(string:homePath)))
	}
	
	@IBAction func openBaiduAction(sender : UIButton) {
		path = "http://baidu.com"
		println(path)
		webView.loadRequest(NSURLRequest(URL: NSURL(string:path)))
	}
	
	@IBAction func openTaobaoAction(sender : UIButton) {
		path = "http://taobao.com"
		println(path)
		webView.loadRequest(NSURLRequest(URL: NSURL(string:path)))
	}
	
	@IBAction func urlTextFieldDidEndOnExitAction(sender : UITextField) {
		self.toUrlInput.resignFirstResponder()
		self.openButton.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
	}
	
	func showAlertView() {
		var alert = UIAlertView()
		//var alert = UIAlertView(title: "alert", message: "this is an alert", delegate: self, cancelButtonTitle: "cancel")
		alert.title = "alert"
		alert.delegate = self
		alert.addButtonWithTitle("cancel")
		alert.message = "this is an alert"
		alert.show()
	}
	
	
	
	/////////////////////////////////////////////////
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initComponent()
		//var secondVC = storyBoardController("SecondVC") as SecondVC
		
		//navigationController.pushViewController(secondVC, animated: true)
        
        var appsVC = storyBoardController("AppsVC") as AppsVC
        
        YJApp.cleanUpNC!.pushViewController(appsVC, animated: true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func initComponent() {
		webView.loadRequest(NSURLRequest(URL: NSURL(string:homePath)))
//		webView.scrollView.delegate = self
		
		self.webView.scrollView.delegate = self
		
		//self.toUrlInput.clearsOnBeginEditing = true
		self.toUrlInput.keyboardType = UIKeyboardType.URL
		self.toUrlInput.returnKeyType = UIReturnKeyType.Done
	}
	
	override func viewWillAppear(animated: Bool) {
		YJApp.cleanUpNC!.navigationBarHidden = true
	}
	
	override func viewWillDisappear(animated: Bool) {
		YJApp.cleanUpNC!.navigationBarHidden = false
	}

}

