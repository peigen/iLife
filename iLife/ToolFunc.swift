//
//  ToolFunc.swift
//  GoldFullHall
//
//  Created by zq on 14-6-20.
//  Copyright (c) 2014 zq. All rights reserved.
//
 

class ToolFunc
{
   
    class func share() -> ToolFunc
    {
        struct SingletonTool{
            static var predicate:dispatch_once_t = 0
            static var instance:ToolFunc? = nil
        }
        dispatch_once(&SingletonTool.predicate,{
                SingletonTool.instance = ToolFunc()
            }
        )
        return SingletonTool.instance!
    }
    
    func delayLoad(delayTime:Float ,block:() -> Void)
    {
        var popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delayTime*1000) * Int64(NSEC_PER_MSEC))
        dispatch_after(popTime, dispatch_get_main_queue(), {
            block()
        });
    }

}
