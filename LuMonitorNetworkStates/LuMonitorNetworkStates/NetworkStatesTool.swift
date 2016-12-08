//
//  NetworkStatesTool.swift
//  LuMonitorNetworkStates
//
//  Created by 路政浩 on 2016/12/8.
//  Copyright © 2016年 路政浩. All rights reserved.
//

import UIKit

enum NetworkStates:Int {
    case NetworkStatesUnknown //未知
    case NetworkStates2G      //2G
    case NetworkStates3G      //3G
    case NetworkStates4G      //4G
    case NetworkStatesWIFI    //WIFI
}

class NetworkStatesTool: NSObject {
    
    class func currentNetworkStates() -> NetworkStates {
        
        let statusBar   = UIApplication.shared.value(forKeyPath: "statusBar") as! UIView
        let foregroundView  = statusBar.value(forKeyPath: "foregroundView") as! UIView
        
        var state :NetworkStates = .NetworkStatesUnknown
        for child in foregroundView.subviews {
            //debugPrint("遍历状态栏:\(child)")
            //UIStatusBarServiceItemView 运营服务商
            //UIStatusBarTimeItemView 时间值
            let Network = child.isKind(of: NSClassFromString("UIStatusBarDataNetworkItemView")!)
            if Network {
                debugPrint("网络状态视图:\(child)")
                let currentNetworkCode = child.value(forKeyPath: "dataNetworkType") as! Int
                debugPrint("网络状态值:\(currentNetworkCode)")
                switch currentNetworkCode {
                case 0:
                    state = .NetworkStatesUnknown
                    break
                case 1:
                    state = .NetworkStates2G
                    break
                case 2:
                    state = .NetworkStates3G
                    break
                case 3:
                    state = .NetworkStates4G
                    break
                case 4 | 5:
                    state = .NetworkStatesWIFI
                    break
                default:
                    break
                }
            }
        }
        return state
    }
}

