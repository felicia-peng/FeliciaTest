//
//  AMHomeVcl.swift
//  FeliciaTest
//
//  Created by 彭惠 on 2020/1/10.
//  Copyright © 2020 彭惠. All rights reserved.
//

import UIKit
import LocalAuthentication

class AMHomeVcl: AMViewController,UITextViewDelegate {
    
    fileprivate lazy var label:UILabel = {
        let label = UILabel.init()
        label.numberOfLines = 0
        let str = "使用手机号码一键登录即代表您已同意《京东隐私x政策》和《中国移动认证服务条款》并使用本季号码登录"
        label.textColor = UIColor.gray
        
        var attstr = NSAttributedString.init(string: str)
        attstr = attstr.es_setColor(UIColor.red, range: NSRange.init(location: 17, length: 9))?
            .es_setColor(UIColor.red, range: NSRange.init(location: 27, length: 12)) ?? NSAttributedString()
    
        label.attributedText = attstr
        label.isUserInteractionEnabled = true
        let click = UITapGestureRecognizer(target: self, action: #selector(clickLabel))
        label.addGestureRecognizer(click)
       // var attstr = NSAttributedString.init(string: str)
     //   attstr = attstr.es_setColor(ESConstant.color.text_gray, range: NSRange.init(location: 0, length: attstr.length))?
     //   .es_setFont(ESConstant.font.pingFangSC(type: .regular, size: 12), range: NSRange.init(location: 0, length: attstr.length))?
      //      .es_setColor(ESConstant.color.main, range: str.es_nsRange(from: str.range(of: protocolStr))) ?? NSAttributedString()
        return label
    }()
    
    fileprivate lazy var textView:UITextView = {
        let view = UITextView.init()
        let str = "使用手机号码一键登录即代表您已同意《京东隐私x政策》和《中国移动认证服务条款》并使用本季号码登录"
        let str1 = "《京东隐私x政策》"
        let str2 = "《中国移动认证服务条款》"
        let rang1:NSRange = (str as NSString).range(of: str1)
        let rang2 = (str as NSString).range(of: str2)
        
        let attrstr = NSMutableAttributedString.init(string: str, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)])
        attrstr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: rang1)
        
       //  [mastring addAttribute:NSLinkAttributeName value:valueString1 range:range1];
       // NSString *valueString1 = [[NSString stringWithFormat:@"firstPerson://%@",str1] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
        let valuestr1 = (("firstPerson://" + str1) as NSString).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlFragmentAllowed)
        
        attrstr.addAttribute(NSAttributedString.Key.link, value: valuestr1 as Any, range: rang1)
        attrstr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: rang2)
        view.attributedText = attrstr
        //view.backgroundColor = UIColor.yellow
        view.isEditable = false
        view.isScrollEnabled = false
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(textView)
        textView.snp.makeConstraints{(make) in
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        
        
//        self.view.addSubview(label)
//        label.snp.makeConstraints{(make) in
//            make.left.right.equalToSuperview().inset(20)
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
        // Do any additional setup after loading the view.
    }
    
    @objc func clickLabel(_ tapGesture:UITapGestureRecognizer){
        let position = tapGesture.location(in: self.label)
        print(position)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("textview shouldinteractwith")
        if (URL.scheme == "firstPerson"){
            print("click firstPerson")
            ESRoute.route(to: testVcl.self, params: nil)
            return false
        }
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
