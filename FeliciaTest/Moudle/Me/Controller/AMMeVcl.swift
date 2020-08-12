//
//  AMMeVcl.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/1/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit

class AMMeVcl: AMViewController {
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView.init()
        //scrollview.backgroundColor = UIColor.yellow
        return scrollview
    }()
    
    fileprivate lazy var contentView: UIView = {
        let view = UIView.init()
        //view.backgroundColor = UIColor.gray
        return view
    }()

    fileprivate lazy var btn1: UIButton = {
        let btn = UIButton.init()
        btn.setTitle("例子1:日历", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(btn1Click), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var btn2: UIButton = {
        let btn = UIButton.init()
        btn.setTitle("例子2:UIStackView", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(btn2Click), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var btn3: UIButton = {
        let btn = UIButton.init()
        btn.setTitle("例子3:UITextField高度跟着文本高度变", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(btn3Click), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadUI()
        self.layout()
        // Do any additional setup after loading the view.
    }
    
    func loadUI(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(btn1)
        self.contentView.addSubview(btn2)
        self.contentView.addSubview(btn3)
    }
    
    func layout(){
        self.scrollView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
            make.height.width.equalToSuperview()
        }
        
        self.btn1.snp.makeConstraints{make in
            make.top.left.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
        
        self.btn2.snp.makeConstraints{make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(self.btn1.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        self.btn3.snp.makeConstraints{make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(self.btn2.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
    }


}

extension AMMeVcl{
    @objc func btn1Click(){
        ESRoute.route(to: CalanderVcl.self, params: nil)
    }
    
    @objc func btn2Click(){
        ESRoute.route(to: StackViewVcl.self, params: nil)
    }
    
    @objc func btn3Click(){
        ESRoute.route(to: TextFieldAutoHeightVcl.self, params: nil)
    }
}
