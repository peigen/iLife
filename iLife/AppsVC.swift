//
//  AppsVC.swift
//  iLife
//
//  Created by zq on 14-7-9.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

import UIKit

class AppsVC : BaseVC,UICollectionViewDelegate,UICollectionViewDataSource
{
    var dicApps : NSMutableArray = NSMutableArray()
    var appsView : UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        customizeRightBarItemWithTarget(self, action: Selector("rightButtonPress:"),title: "通讯录")
        
        var layout = AppLayout()
        layout.initParam()
        
        appsView = UICollectionView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-20-44), collectionViewLayout: layout)
        appsView.backgroundColor = UIColor.whiteColor()
        
        appsView.registerNib(UINib(nibName: "AppCell",bundle: nil), forCellWithReuseIdentifier: "AppCell")
        
        appsView.dataSource = self;
        appsView.delegate = self;
        appsView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(appsView)
        
        SVProgressHUD.showWithStatus("初始化中...")
        
        MyApps().detectAppSchemes({
                appDic in
                SVProgressHUD.dismiss()
                self.dicApps.addObjectsFromArray(appDic)
                self.appsView.reloadData()
                //println(self.dicApps)
            
            },failApp:
            {
                error in
                SVProgressHUD.showErrorWithStatus(error.localizedDescription)
                println(error)
            })
 
    }
    
    override func rightButtonPress(sender:AnyObject?)
    {
        var adBook = storyBoardController("ADBookVC") as ADBookVC
        YJApp.cleanUpNC!.pushViewController(adBook, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        return dicApps.count
    }
    
    
   func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int
    {
        return 1
    }
    
     func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("AppCell", forIndexPath: indexPath) as AppCell
        var dic = dicApps.objectAtIndex(indexPath.row*(indexPath.section+1)) as NSDictionary
        cell.showApp(dic)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!)
    {
        var selApp = dicApps.objectAtIndex(indexPath.row*(indexPath.section+1)) as NSDictionary
        
        var scheme = selApp.objectForKey("scheme") as String
        sysUrl.openURLApp(scheme)
         
    }
}
