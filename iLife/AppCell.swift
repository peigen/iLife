//
//  AppCell.swift
//  iLife
//
//  Created by zq on 14-7-9.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

class AppCell : UICollectionViewCell
{
    @IBOutlet var appImg : UIImageView

    @IBOutlet var appName : UILabel
    
    func showApp(appDictionary: NSDictionary)
    {
        appName.text = appDictionary.objectForKey("trackName") as String
        
        var artworkUrl60 = appDictionary.objectForKey("artworkUrl60") as String
        appImg.setImageWithURL(NSURL.URLWithString(artworkUrl60), placeholderImage:UIImage(named:"placeholder-icon"))
    }
}
