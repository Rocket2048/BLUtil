//
//  ViewController.swift
//  BLUtil
//
//  Created by ok@linbok.com on 03/19/2019.
//  Copyright (c) 2019 ok@linbok.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BLLabel().text = "1"
        
        
        print(BLUtil.md5("1"))
        
        let data = "1".data(using: .utf8)
        
        print(BLUtil.md5(data ?? Data()))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

