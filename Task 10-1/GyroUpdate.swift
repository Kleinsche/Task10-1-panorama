//
//  GyroUpdate.swift
//  Task 10-1
//
//  Created by 🍋 on 2016/12/21.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit
import CoreMotion

class GyroUpdate: NSObject {
    var cmm = CMMotionManager()
    
    func startGyroUpdate(scroll: ScrollView) {
        cmm.gyroUpdateInterval = 0.001
        
        if cmm.isGyroAvailable{
            cmm.startGyroUpdates(to: OperationQueue.main, withHandler: {
                (data:CMGyroData?,err:Error?) in
                
                let gyroY = Int(data!.rotationRate.y / 0.1)
                var offset = Double(scroll.contentOffset.x)
                offset -= Double(gyroY) * Double(kScreenWidth) / M_PI * 2
                scroll.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
            })
        }else {
            print("陀螺仪感器不可用")
        }
    }
    
    func stopGyroUpdate() {
        if cmm.isGyroActive {
            cmm.stopGyroUpdates()
        }
    }
    
}
