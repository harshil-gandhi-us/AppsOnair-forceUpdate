//
//  ViewController.swift
//  forceUpdate
//
//  Created by 164989979 on 07/24/2024.
//  Copyright (c) 2024 164989979. All rights reserved.
//

import UIKit
import forceUpdate

class ViewController: UIViewController {
    let forceUpdateController = AppsOnAirServices()
    override func viewDidLoad() {
        super.viewDidLoad()
        forceUpdateController.initialize()
        forceUpdateController.showNativeAlert(showNativeUI: true)
        forceUpdateController.checkForAppUpdate({ value in
            print("ss")
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

