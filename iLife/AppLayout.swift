//
//  AppLayout.swift
//  iLife
//
//  Created by zq on 14-7-9.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

class AppLayout: UICollectionViewFlowLayout
{
    
    func initParam()
    {
        self.itemSize = CGSizeMake(70, 100)
        self.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0)
        self.minimumInteritemSpacing = 10.0
        self.minimumLineSpacing = 10.0
    }
}
