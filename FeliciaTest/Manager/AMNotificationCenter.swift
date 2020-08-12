//
//  AMNotificationCenter.swift
//  donggang_strawberry_ios
//
//  Created by codeLocker on 2019/11/30.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import UIKit

class AMNotificationCenter: NSObject {
    
    static let land_detail_reload = "com.land.detail.reload"
    static let address_list_reload = "com.address.list.reload"
    static let book_list_reload = "com.book.list.reload"
    static let news_list_reload = "com.news.list.reload"
    static let product_detail_reload = "com.product.detail.reload"
    static let lecture_list_reload = "com.lecture.list.reload"
    static let timeline_reload = "com.timeline.reload"
    static let home_reload = "com.home.reload"
    static let home_reload_land = "com.home.reload.land"
    static let home_route_timeline = "com.home.route.timeline"
    static let order_list_land = "com.order.list.land"
    static let me_reload_timeline_unread = "com.me.reload.timeline.unread"
    static let me_reload_order_count = "com.me.reload.order.count"
    static let me_reload_collect_each_count = "com.me.reload.collect.each.count"
    static let video_stop_play = "com.video.stop.play"
    static let video_reset = "com.video.reset"
    
    static let user_logout = "com.user.logout"
    static let land_list_reload = "com.land.list.reload"
    static let land_list_reset = "com.land.list.reset"
    static let person_data_reload = "com.person.data.reload"
    static let modify_header_img = "com.modify.header.img"
    static let modify_nick_name = "com.modify.nick.name"
    static let untry_farmer = "com.untry.farmer"
    
    static func register(_ observer: Any, selector aSelector: Selector, name aName: String?, object anObject: Any?) {
        if AMUtils.isEmptyString(aName) {
            return
        }
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: NSNotification.Name(rawValue: aName!), object: anObject)
    }
    
    static func post(name aName: String?, object anObject: Any?) {
        if AMUtils.isEmptyString(aName) {
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: aName!), object: anObject)
    }
    
    static func remove(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
}
