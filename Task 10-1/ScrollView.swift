//
//  ScrollView.swift
//  Task10
//
//  Created by 🍋 on 2016/12/6.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

class ScrollView: UIScrollView,UIScrollViewDelegate {
    private var gyro = GyroUpdate()
    var offset = Double()
    
    
    func initScrollView() {
        self.delegate = self
        for i in 0..<2 {
            let img = UIImageView.init(frame: CGRect.init(x: kScreenWidth * CGFloat(i) * 4  , y: 0, width: kScreenWidth * 4 , height: kScreenHeight))
            img.image = UIImage.init(named: "全景.jpg")
            self.addSubview(img)
        }
//        self.contentSize = CGSize.init(width: kScreenWidth * 8, height: self.frame.height)
//        self.isScrollEnabled = false
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = Double(self.contentOffset.x)
        if (offset >= Double(kScreenWidth) * 6) {
            self.setContentOffset(CGPoint(x: kScreenWidth * 2 , y: 0), animated: false)
        }else if (offset <= Double(kScreenWidth)){
            self.setContentOffset(CGPoint(x: Double(kScreenWidth) * 5, y: 0), animated: false)
        }
        print(self.contentOffset.x)
    }
    

    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.initScrollView()
        self.setContentOffset(CGPoint(x: kScreenWidth * 5 , y: 0), animated: false)
    }
    

}
