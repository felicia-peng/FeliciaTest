//
//  AMTabBar.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/1/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit
import SnapKit

class AMTimelineButton: UIView {
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "am_tabbar_timeline")
        return imageView
    }()
    
    fileprivate lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.text = "草莓朋友圈"
        lab.textColor = ESConstant.color.text_gray
        lab.textAlignment = .center
        lab.font = ESConstant.font.pingFangSC(type: .medium, size: 11)
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadUI()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Load_UI
    private func loadUI() {
        self.addSubview(self.imageView)
        self.addSubview(self.titleLab)
    }
    
    private func layout() {
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(0)
            make.right.lessThanOrEqualToSuperview().offset(0)
        }
        self.titleLab.snp.makeConstraints { (make) in
            make.left.greaterThanOrEqualToSuperview().offset(0)
            make.right.lessThanOrEqualToSuperview().offset(0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(0)
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if AMUser.user?.isLogin ?? false {
//            ESRoute.route(to: AMTimelinePublishViewController.self, params: ["from": "AMTabBar"])
//        } else {
//            ESRoute.routeToLogin()
//        }
//    }
}

class AMTabBar: UITabBar {
    
    fileprivate lazy var timelineBtn: AMTimelineButton = {
        let btn = AMTimelineButton()
        return btn
    }()
    
    fileprivate lazy var shadowBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "am_tabbar_background")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadUI() {
        self.backgroundColor = UIColor.white
        self.isTranslucent = false
        self.insertSubview(self.shadowBackgroundImageView, at: 0)
        self.shadowBackgroundImageView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(ESConstant.screen.bottomSafeMargin)
        }
        self.addSubview(timelineBtn)
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var items = [Any]()
        
        let _ = self.subviews.map { (subView) in
            // 将所有UITabBarButton存放到数组中
            if subView.isKind(of: NSClassFromString("UITabBarButton")!) {
                items.append(subView)
            }
        }
        let itemWidth = self.es_width / CGFloat(items.count + 1)
        self.timelineBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.shadowBackgroundImageView)
            make.top.equalTo(self.shadowBackgroundImageView).offset(10)
        }
        
        //        if AMUser.user?.isLogin ?? false {
        let tmp = items.last!
        items.insert(tmp, at: 1)
        items.removeLast()
        //        } else {
        //
        //        }
        
        for (index, subview) in items.enumerated() {
            // 取出subview的frame
            var subviewFrame = (subview as! UIView).frame
            if index >= items.count / 2 {
                //设置后半段按钮位置
                subviewFrame.origin.x = CGFloat(index + 1) * itemWidth
            } else {
                //设置前半段按钮位置
                subviewFrame.origin.x = CGFloat(index) * itemWidth
            }
            // 设置tabBarButton的宽度
            subviewFrame.size.width = itemWidth
            // 重写设置tabBarButton的frame
            (subview as! UIView).frame = subviewFrame
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // 调用父控件的hitTest(_ : , with : )方法
        var result = super.hitTest(point, with: event)
        // 如果控件不可交互、控件被隐藏，或者控件是透明的，则表示不能处理事件(控件不交互的三种情况)
        if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
            return nil
        }

        // 当result可以处理事件时，返回result
        if (result != nil) {
            return result
        }
        // 遍历tabBar的子空间
        for subview in subviews {
            if subview == self.shadowBackgroundImageView {
                continue
            }
            // 把这个坐标从tabBar的坐标系转为postButton的坐标系
            let subPoint: CGPoint = subview.convert(point, from: self)
            // 调用子控件，也就是postButton的hitTest(_ : , with : )方法
            result = subview.hitTest(subPoint, with: event)
            // 如果事件发生在subview里就返回result
            if (result != nil) {
                return result
            }
        }
        return nil
    }
}
