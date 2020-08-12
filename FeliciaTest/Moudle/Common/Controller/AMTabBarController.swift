//
//  AMTabBarController.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/1/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit

class AMTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addViewController(AMHomeVcl(), title: "首页", normalImage: "am_tabbar_home_normal", selectImage: "am_tabbar_home_selected")
        self.addViewController(AMLandVcl(), title: "地块", normalImage: "am_tabbar_land_normal", selectImage: "am_tabbar_land_selected")
        self.addViewController(AMNewsVcl(), title: "资讯", normalImage: "am_tabbar_news_normal", selectImage: "am_tabbar_news_selected")
        self.addViewController(AMMeVcl(), title: "我的", normalImage: "am_tabbar_me_normal", selectImage: "am_tabbar_me_selected")
        
        let tabBar = AMTabBar()
        tabBar.delegate = self
    
        self.setValue(tabBar, forKeyPath: "tabBar")
        //self.view.backgroundColor = UIColor.white
    }
    
    func addViewController(_ vc: AMViewController, title: String, normalImage: String, selectImage: String) {
        
        let item = UITabBarItem.init()
        item.title = title
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ESConstant.color.main, NSAttributedString.Key.font: ESConstant.font.pingFangSC(type: .medium, size: 11)], for: .selected)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ESConstant.color.text_gray, NSAttributedString.Key.font: ESConstant.font.pingFangSC(type: .medium, size: 11)], for: .normal)
        
        item.image = UIImage.init(named: normalImage)?.withRenderingMode(.alwaysOriginal)
        item.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        
        let nav = AMNavigationController.init(rootViewController: vc)
        nav.tabBarItem = item
      //  self.am_viewController.append(nav)
        self.addChild(nav)
    }

}
