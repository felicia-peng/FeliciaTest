//
//  AMLandVcl.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/1/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit

class AMLandVcl: AMViewController {
    
    fileprivate lazy var button:UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(sendMsg), for: .touchUpInside)
        btn.setTitle("发送消息推送", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadUI()
        self.layout()
        // Do any additional setup after loading the view.
    }
    
    func loadUI(){
        self.view.addSubview(self.button)
    }
    
    func layout(){
        self.button.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
        }
    }

}

extension AMLandVcl{
    @objc func sendMsg(){
        let content = UNMutableNotificationContent()
        content.title = "gaosun"
        content.body = "新消息"
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 0.5, repeats: false)
        let request = UNNotificationRequest.init(identifier: "FeliciaTest", content: content, trigger: trigger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error as Any)
        }
    }
}

extension AMLandVcl: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }
}
