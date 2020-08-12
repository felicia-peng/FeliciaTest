//
//  ESNetworking.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/25.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit
import Alamofire

class ESNetworking: NSObject {
    static func get(url: String?, params: [String: Any]?, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {
        
        Alamofire.request(url ?? "", method: .get, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
   
            response.result.ifSuccess {
                
                if ESConstant.isDebug {
                    print("-------- 网络请求 --------")
                    print("请求接口:\(url ?? "--")")
                    print("请求参数:\(params ?? [String: Any]())")
                    print("请求头:\(header ?? [String: Any]())")
                }

                if let value = response.result.value as? [String: Any] {
                    
                    if ESConstant.isDebug {
                        print("返回数据:\(value)")
                    }
                          
                    if (value["code"] as? Int) == 412 {
                   //     AMUser.logout()
                        ESRoute.routeToLogin()
                        fail("请登录")
                        return
                    }
                    
                    success(value)
                    
                } else {
                    if ESConstant.isDebug {
                        print("返回数据: 数据解析失败")
                    }
                    fail("数据解析失败")
                }
            }
            response.result.ifFailure {
                
                if ESConstant.isDebug {
                    print("请求出错: \(response.error?.localizedDescription ?? "未知异常")")
                }
            
                fail(response.error?.localizedDescription)
            }

        }
    }
    
    static func post(url: String?, params: [String: Any]?, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {

         Alamofire.request(url ?? "", method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            
            if ESConstant.isDebug {
                print("-------- 网络请求 --------")
                print("请求接口:\(url ?? "--")")
                print("请求参数:\(params ?? [String: Any]())")
                print("请求头:\(header ?? [String: Any]())")
            }
            
             response.result.ifSuccess {
                 if let value = response.result.value as? [String: Any] {
                    
                    if ESConstant.isDebug {
                        print("返回数据:\(value)")
                    }
                    
                    if (value["code"] as? Int) == 412 {
                 //       AMUser.logout()
                        ESRoute.routeToLogin()
                        fail("请登录")
                        return
                    }
                    
                    success(value)
                     
                 } else {
                    if ESConstant.isDebug {
                        print("返回数据: 数据解析失败")
                    }
                     fail("数据解析失败")
                 }
             }
             response.result.ifFailure {
                if ESConstant.isDebug {
                    print("请求出错: \(response.error?.localizedDescription ?? "未知异常")")
                }
                 fail(response.error?.localizedDescription)
             }

         }
     }
    
    static func delete(url: String?, params: [String: Any]?, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {
        Alamofire.request(url ?? "", method: .delete, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            
            response.result.ifSuccess {
                if let value = response.result.value as? [String: Any] {
                    success(value)
                    
                } else {
                    fail("数据解析失败")
                }
            }
            response.result.ifFailure {
                fail(response.error?.localizedDescription)
            }
            
        }
    }
    
    static func post_json(url: String?, params: [String: Any]?, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {
        
        if ESConstant.isDebug {
            print("-------- 网络请求 --------")
            print("请求接口:\(url ?? "--")")
            print("请求参数:\(params ?? [String: Any]())")
            print("请求头:\(header ?? [String: Any]())")
        }
        
        Alamofire.request(url ?? "", method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            response.result.ifSuccess {
                if let value = response.result.value as? [String: Any] {
                    
                    if ESConstant.isDebug {
                        print("返回数据:\(value)")
                    }
                    
                    success(value)
                    
                } else {
                    if ESConstant.isDebug {
                        print("返回数据: 数据解析失败")
                    }
                    fail("数据解析失败")
                }
            }
            response.result.ifFailure {
                if ESConstant.isDebug {
                    print("请求出错: \(response.error?.localizedDescription ?? "未知异常")")
                }
                fail(response.error?.localizedDescription)
            }
        }
    }
    
    static func put_json(url: String?, params: [String: Any]?, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {
        Alamofire.request(url ?? "", method: .put, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            response.result.ifSuccess {
                if let value = response.result.value as? [String: Any] {
                    success(value)
                    
                } else {
                    fail("数据解析失败")
                }
            }
            response.result.ifFailure {
                fail(response.error?.localizedDescription)
            }
        }
    }
    
    static func put(url: String?, params: [String: Any]?, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {
         Alamofire.request(url ?? "", method: .put, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
             response.result.ifSuccess {
                 if let value = response.result.value as? [String: Any] {
                     success(value)
                     
                 } else {
                     fail("数据解析失败")
                 }
             }
             response.result.ifFailure {
                 fail(response.error?.localizedDescription)
             }
         }
     }
    
    static func upload(url: String?, image: UIImage, key: String, header: [String: String]?, success: @escaping ([String: Any]) -> Void, fail: @escaping (String?) -> Void) {
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            let data = image.jpegData(compressionQuality: 0.5)
            let name = Date().es_string(formatter: "yyyy-MM-dd HH:mm:ss") + ".jpg"
            multipartFormData.append(data!, withName: key, fileName: name, mimeType: "image/jpeg")
        },  to: url ?? "",
            method: .post,
            headers: nil) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    guard let result = response.result.value as? [String: Any] else { return }
                    success(result)
                }
            case .failure(_):
                fail("上传失败")
            }
        }
    }
}
