//
//  ViewController.swift
//  LuMonitorNetworkStates
//
//  Created by 路政浩 on 2016/12/8.
//  Copyright © 2016年 路政浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let net  = NetworkStatesTool.currentNetworkStates().hashValue
        debugPrint("网络状态\(net)")
    }
}

