//
//  ViewController.swift
//  Task 10-1
//
//  Created by 🍋 on 2016/12/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private  var gyro = GyroUpdate()
    private  var scroll = ScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scroll.frame = self.view.frame
        self.view.addSubview(self.scroll)

    }

    override func viewWillAppear(_ animated: Bool) {
        self.gyro.startGyroUpdate(scroll: self.scroll)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.gyro.stopGyroUpdate()
    }
    
    
    
    
}

