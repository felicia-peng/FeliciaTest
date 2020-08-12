//
//  TextFieldAutoHeightVcl.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/8/11.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit

class TextFieldAutoHeightVcl: AMViewController {
    
    static let ctnHeight:CGFloat = 50
    
    fileprivate lazy var contentView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    fileprivate lazy var lab:UILabel = {
        let label = UILabel.init()
        label.text = "文本标题"
        label.textColor = UIColor.black
        return label
    }()
    
    fileprivate lazy var textField:UITextView = {
        let textview = UITextView.init()
        textview.font = UIFont.systemFont(ofSize: 15)
        textview.showsVerticalScrollIndicator = false
        textview.showsHorizontalScrollIndicator = false
        textview.delegate = self
        textview.backgroundColor = UIColor.clear
        return textview
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUI()
        self.layout()
    }

    func loadUI(){
        self.view.addSubview(contentView)
        self.contentView.addSubview(lab)
        self.contentView.addSubview(textField)
        self.textField.becomeFirstResponder()
    }
    
    func layout(){
        
        self.contentView.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(TextFieldAutoHeightVcl.ctnHeight)
        }
        
        self.lab.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        self.textField.snp.makeConstraints{(make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.lab.snp.right).offset(10)
           
        }
    }
    
}

extension TextFieldAutoHeightVcl: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.lineSpacing = 0
        
        let font = UIFont.systemFont(ofSize: 15)
        
        let size = CGSize.init(width: self.textField.frame.width, height: 10000)
        
        let str = NSString.init(string: textView.text)
        var attributes = [NSAttributedString.Key: Any]()
        attributes[NSAttributedString.Key.font] = font
        
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        
        let newsize = str.boundingRect(with: size,
                                options: [.usesFontLeading, .usesLineFragmentOrigin],
                                attributes: attributes,
                                context: nil).size
        
        let height = newsize.height + 20
        
        if (height > TextFieldAutoHeightVcl.ctnHeight){
            self.contentView.snp.updateConstraints{make in
                make.height.equalTo(height)
            }
        }
    }
}
