//
//  AMIMManager.swift
//  donggang_strawberry_ios
//
//  Created by codeLocker on 2019/12/4.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit
import JMessage
import AVFoundation

protocol AMIMManagerDelegate: NSObjectProtocol {
    func imManager(_ manager: AMIMManager, didSend message: JMSGMessage?, error: Error?)
    func imManager(_ manager: AMIMManager, didReceive message: JMSGMessage?, error: Error?)
}


class AMIMManager: NSObject {
    
    static var manager = AMIMManager()
    weak var delegate: AMIMManagerDelegate?
    
    func setup(launchOptions: [AnyHashable : Any]?) {
        JMessage.setupJMessage(launchOptions, appKey: ESConstant.key.urora, channel: ESConstant.channel.app_store.rawValue, apsForProduction: false, category: nil, messageRoaming: false)
        JMessage.register(forRemoteNotificationTypes: UInt(UNAuthorizationOptions.badge.rawValue) + UInt(UNAuthorizationOptions.badge.rawValue) + UInt(UNAuthorizationOptions.badge.rawValue), categories: nil)
        
    }
    
    func setupDelegate() {
        JMessage.add(self, with: nil)
    }
    
    func removeDelegate() {
        JMessage.remove(self, with: nil)
    }
    
    func register(username: String, password: String, complete: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        JMSGUser.register(withUsername: username, password: password) { (result, error) in
            complete(result, error)
        }
    }
    
    func login(username: String, password: String, complete: @escaping (_ result: JMSGUser?, _ error: Error?) -> Void) {
        JMSGUser.login(withUsername: username, password: password) { (result, error) in
            complete(result as? JMSGUser, error)
        }
    }
    
    func logout(complete: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        JMSGUser.logout { (result, error) in
            complete(result, error)
        }
    }
    
    func createConversation(to username: String, complete: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        JMSGConversation.createSingleConversation(withUsername: username) { (result, error) in
            complete(result, error)
        }
    }
    
    func sendMessage(_ message: String, to username: String) {
        let content = JMSGTextContent.init(text: message)
        let message = JMSGMessage.createSingleMessage(with: content, username: username)
        JMSGMessage.send(message)
    }
    
    func sendImageMessage(image: UIImage, to username: String) {
        guard let data = image.jpegData(compressionQuality: 0.5) else {
            return
        }
        guard let content = JMSGImageContent.init(imageData: data) else {
            return
        }
        let message = JMSGMessage.createSingleMessage(with: content, username: username)
        JMSGMessage.send(message)
    }
    
    func sendAudioMessage(fileUrl: String, to username: String, duration: CGFloat) {
        let url = URL.init(fileURLWithPath: fileUrl)
//        print(url)
        let data = try? Data.init(contentsOf: url)
        guard let voiceData = data else {
            return
        }
        let content = JMSGVoiceContent.init(voiceData: voiceData, voiceDuration: NSNumber(value: Int(duration)))
        let message = JMSGMessage.createSingleMessage(with: content, username: username)
        JMSGMessage.send(message)
    }
    
    func fetchAllConversations(complete: @escaping (_ result: [JMSGConversation]?, _ error: Error?) -> Void) {
        JMSGConversation.allConversations { (result, error) in
            complete(result as? [JMSGConversation], error)
        }
    }
    
    func fetchAllMessages(for conversation: JMSGConversation, complete: @escaping (_ result: [JMSGMessage]?, _ error: Error?) -> Void) {
        conversation.allMessages { (result, error) in
            complete(result as? [JMSGMessage], error)
        }
    }
}

extension AMIMManager: JMessageDelegate {
    //在线获取消息
    func onReceive(_ message: JMSGMessage!, error: Error!) {
        self.delegate?.imManager(self, didReceive: message, error: error)
    }
    
    //发送消息回调
    func onSendMessageResponse(_ message: JMSGMessage!, error: Error!) {
        self.delegate?.imManager(self, didSend: message, error: error)
    }
    

    
    
}
