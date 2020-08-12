//
//  StackViewVcl.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/8/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit

class StackViewVcl: AMViewController {
    
    fileprivate lazy var scrollView:UIScrollView = {
        let scrollview = UIScrollView.init()
        return scrollview
    }()
    
    fileprivate lazy var contentView:UIView = {
        let view = UIView.init()
        return view
    }()
    
    fileprivate lazy var stackView:UIStackView = {
        let stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.systemPink
        return stackView
    }()
    
    fileprivate lazy var btn:UIButton = {
        let btn = UIButton.init()
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("添加", for: .normal)
        btn.addTarget(self, action: #selector(addOneView), for: .touchUpInside)
        btn.backgroundColor = UIColor.orange
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
        self.contentView.addSubview(stackView)
        self.view.addSubview(btn)
    }
    
    func layout(){
        
        self.btn.snp.makeConstraints{make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        self.scrollView.snp.makeConstraints{make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(self.btn.snp.top).offset(-10)
        }
        
        self.contentView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        self.stackView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }

}

extension StackViewVcl{
    @objc func addOneView(){
        let imgview = UIImageView.init()
        imgview.image = UIImage.init(named: "am_test_banner2")
        
        self.stackView.addArrangedSubview(imgview)
    }
}
