//
//  ItemBaseVC.swift
//  iLife
//
//  Created by peigen on 14-6-28.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

import Foundation
import UIKit

class ItemBaseVC :BaseVC {
	
	// layout height
	//	568-20(top bar)-44(navi bar)
	//	-10(top space)
	//	-20(used to view title)-57(app height)
	//	-20(app view title)-57(app height)
	//	-20(call view title)-57(app height)
	//	-20(unkown view title)-57(app height)
	
	
	struct CLScrollView {
		
		var frame : CGRect = CGRectMake( 0, 0 , SCREEN_WIDTH, ICON_HEIGHT + VIEW_TITLE)
		var contentSize : CGSize = CGSize(width: SCREEN_WIDTH * 2, height: ICON_HEIGHT + VIEW_TITLE)
	}
}