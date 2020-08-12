//
//  ESAPI.swift
//  water_conservancy_ios
//
//  Created by codeLocker on 2019/8/25.
//  Copyright © 2019 codeLocker. All rights reserved.
//

import Foundation

//0:开发环境 1:生产环境
//let ES_HOST_ENVIRONMENT: Int = 1
//开发环境
let ES_HOST_API_DEVELOPMENT: String = "http://47.103.110.226:8094/strawberry-app/"
let ES_HOST_API_PRODUCT: String = "http://api.caomeigang.com:8094/strawberry-app/"

//let ES_HOST_API_DEVELOPMENT: String = "http://10.30.1.95:8094/strawberry-app/"

let ES_HOST_WEB_DEVELOPMENT: String = "http://47.103.110.226:8097/big-data/#/"
let ES_HOST_WEB_PRODUCT: String = "http://api.caomeigang.com:8097/big-data/#/"

let ES_HOST_WEB_MAP_DEVELOPMENT: String = "http://47.103.110.226:8097/big-data/google_offline/"
let ES_HOST_WEB_MAP_PRODUCT: String = "http://api.caomeigang.com:8097/big-data/google_offline/"

enum ESAPI: String {
    static func host_api() -> String {
        if ESConstant.environment.current == .develop {
            return ES_HOST_API_DEVELOPMENT
        } else if ESConstant.environment.current == .product {
            return ES_HOST_API_PRODUCT
        }
        return ""
    }
    
    static func host_web() -> String {
        if ESConstant.environment.current == .develop {
            return ES_HOST_WEB_DEVELOPMENT
        } else if ESConstant.environment.current == .product {
            return ES_HOST_WEB_PRODUCT
        }
        return ""
    }
    
    static func host_map() -> String {
        if ESConstant.environment.current == .develop {
            return ES_HOST_WEB_MAP_DEVELOPMENT
        } else if ESConstant.environment.current == .product {
            return ES_HOST_WEB_MAP_PRODUCT
        }
        return ""
    }
    
    func url_api() -> String {
        return ESAPI.host_api() + self.rawValue
    }
        
    func url_web() -> String {
        return ESAPI.host_web() + self.rawValue
    }
    
    func url_web_map() -> String {
        return ESAPI.host_map() + self.rawValue
    }
    
    
    case login     = "api/login" //登录接口
    case verificationCode     = "api/verification_code" //获取验证码
    case verificationCode_check = "api/verify_register_verification_code" //验证码校验
    case register = "api/register" //注册
    case password_forget = "api/forget_password" //忘记密码
    case update_user_info = "api/update_user_info" //填写资料
    case upload_image = "api/upload/img" //上传图片
//    case upload_image = "api/base/upload" //上传图片
    

    
    case home_banner = "api/select_banner_list" //首页Banner
    
    case professor_list = "api/select_expert_list" //专家列表
    
    case lecture_like = "api/form_like" //讲堂点赞
    case lecture_collect = "api/form_collect" //讲堂收藏
    case lecture_category = "api/select_forum_type" //查看讲堂分类
    case lecture_list = "api/select_forum_list" //专家讲堂列表
    
    case news_list = "api/select_information_list" //资讯列表
    case news_collect = "api/information_collect" //资讯收藏
    case news_category = "api/select_information_type" //资讯类型
    case news_strawberry_price = "api/select_strawberry_list" //草莓价格
    
    case message_unread_count = "api/select_un_read_message_count" //查看未读的消息的个数
    
    case timelines_list = "api/select_friend_ring_list" //草莓朋友圈列表
    case timelines_collect = "api/friend_ring_collect" //草莓朋友圈收藏
    case timelines_like = "api/friend_ring_like" //草莓朋友圈点赞
    case timelines_categoty = "api/select_friend_ring_category" //草莓朋友圈分类
    case timelines_publish = "api/release_friend_ring" //发布话题
    case timelines_detail = "api/select_friend_ring_detail" //草莓朋友圈详情
    case timelines_report = "api/friend_ring_report" //草莓朋友圈举报
    case timelines_comment = "api/release_friend_ring_comment" //草莓朋友圈评论
    case timelines_delete = "api/deleted_user_friend_ring" //草莓朋友圈删除
    
    
    case land_home_plot = "api/select_home_plot_info" //首页地块信息
    case land_home_base = "api/select_home_base_info" //首页基地信息
    case land_monitor_list = "api/select_plot_monitor_list" //地块视频列表
    case land_list = "api/select_user_plot_list" //地块列表
    case land_Info = "api/select_plot_detail_info" //编辑查看地块
    case land_monitor_info = "api/select_things_monitor" //查看物联监控
    case land_monitor_info_update = "api/update_things_monitor" //编辑物联监控
    case land_farm_record_add = "api/add_plot_farmer_operations_record" //农事记录添加
    case land_farm_record_segement = "api/select_farm_segment_type" //农事记录环节列表
    case land_top = "api/set_plot_top" //地块置顶
    case land_farm_record_list = "api/select_farmer_operation_record_list" //农事记录列表
    
    case land_farm_record_update = "api/update_plot_farmer_operations_record" //农事记录编辑
    
    
    
    case land_add = "api/user_release_plot" //编辑发布
    case land_edit = "api/user_edit_plot" //编辑地块
    
    case citys = "api/region/province_city_area" //获取省市县地址
    
    case books = "api/select_account_book_list_month" //查看账目
    case book_purpose = "api/select_account_book_type_list" //账目类型
    case book_add = "api/add_account_book_record" //账目新增
    case book_delete = "api/deleted_account_book" //账目删除
    case book_update = "api/update_account_book_record" //账目编辑
    case book_detail = "api/select_account_book_record" //账目详情
    case book_search = "api/select_account_book_list_day" //账目搜索
    
    case base_detail = "api/select_base_detail_info" //查看基地详情
    case base_land_list = "api/select_base_link_plot_list" //查看地块列表
    
    case product_category = "api/select_goods_first_category" //商品类型
    case product_list = "api/select_goods_list" //商品列表
    case product_detail = "api/select_goods_detail" //商品详情
    case product_collect = "api/user_collect_goods" //商品收藏
    case product_comments = "api/select_goods_comment_list" //商品评论列表
    case product_recommendeds = "api/select_goods_recommended" //商品推荐列表
    
    case ai_category = "api/select_intelligent_type" //病理分类
    case ai_record_list = "api/select_intelligent_file" //病理档案
    case ai_result_list = "api/select_pathology_list" //病理结果
    case ai_add = "api/release_farmer_pathology" //新增病虫识别
    case ai_result_detail = "api/select_farmer_pathology_detail" //病理结果详情
    case ai_result_unread_count = "api/select_pathology_no_read_count" //病理结果未读数量
    case ai_result_delete = "api/deleted_pathology_by_id" //病理识别结果删除
    
    case notification_warning_list = "api/select_user_remind_message_list" //预警提醒列表
    case notification_detail = "api/select_message_detail" //预警提醒详情
    case notification_custom_list = "api/select_user_exclusive_message_list" //专属定制列表
    case notification_check_list = "api/select_user_check_plot_message_list" //审核通知列表
    case notification_delete = "api/deleted_message_by_id" //消息删除
    case notification_check_delete = "api/deleted_check_notice_by_id" //审核消息删除
    
    case order_buy = "api/goods/buy_now_goods" //立即购买
    case order_submit = "api/submit_goods_order" //提交订单
    case order_list = "api/select_user_order_list" //订单列表
    case order_detail = "api/select_order_detail" //订单详情
    case order_cancel = "api/user_cancel_order" //订单取消
    case order_comment = "api/user_comment_goods" //订单评价
    case order_pay = "api/user_wechat_pay" //支付
    case order_confirm = "api/confirm_receipt" //确认收货
    case order_comment_list = "api/select_order_comment_list" //订单评价列表
    case order_delete = "api/deleted_order_by_order_id" //订单删除
    
    case address_list = "api/select_member_address_list" //地址列表
    case address_add = "api/add_member_address" //地址添加
    case address_update = "api/update_member_address" //地址编辑
    case address_delete = "api/deleted_member_address" //地址删除
    
    case me_collect_timelines = "api/select_user_collect_topic_list" //收藏草莓朋友圈
    case me_collect_lectures = "api/select_user_collect_forum_list" //收藏专家讲堂
    case me_collect_news = "api/select_user_collect_information_list" //收藏行业资讯
    case me_collect_product = "api/select_user_collect_goods_list" //收藏商品
    case me_collect_all_unread_count = "api/select_collect_all_no_read_count"//查看所有的收藏未读的
    case me_collect_each_unread_count = "api/select_collect_each_no_read_count"//查看每个的收藏未读的
    
    case web_privacy_agreement = "privacyAgreement" //隐私协议
    case web_platform_statement = "platformStatement" //平台声明
    case web_new_detail = "industryInfo-detail" //行业资讯详情 id token
    case web_lecture_detail = "expertClass-detail" //专家讲堂详情 id token
    case web_prefessor_detail = "expertHome-index" //专家主页 id token
    case web_ai_detail = "pathology-detail" //病理详情 id  token
    case web_product_details = "product-detail" //产品详情 id
    case web_notification_detail = "exclusiveCustom-detail" //通知消息详情
    case web_map_detail = "map.html"
    case web_map_pick = "map2.html"
    
    case mycomment_list = "api/select_user_owner_comment_topic_list" //我的评论列表
    case mypublish_list = "api/select_user_release_friend_ring" //我的发布列表
    case logout = "api/sys/logout" //退出登录
    case getuserinfo = "api/select_user_info" //获取用户资料
    case update_password = "api/update_password" //修改密码
    case noreadnum = "api/select_friend_ring_no_read_count" //我的朋友圈未读数量
    case ordercount = "api/select_order_statistics_count" //订单统计数量
    case remove_bind = "api/user_remove_bind"  //解绑农场
    case myfarmer_list = "api/select_base_farmer" //我的农户列表
    case myairesult_list = "api/select_farmer_pathology_list" //我的ai列表
}

