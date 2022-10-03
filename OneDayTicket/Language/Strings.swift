//
//  Strings.swift
//  OpenAlign
//
//  Created by AndyWu on 2020/2/27.
//  Copyright © 2020 OpenAlign. All rights reserved.
//

import UIKit

protocol Localizable {
    var localizedKey: String? { get set }
}

// Follow the Localizable protocol for IBOutLet
extension UILabel: Localizable {
    @IBInspectable var localizedKey: String? {
        get { return nil }
        set(key) {
            if let key = key {
                self.text = NSLocalizedString(key, comment: "")
            }
        }
    }
}

extension UIButton: Localizable {
    @IBInspectable var localizedKey: String? {
        get { return nil }
        set(key) {
            if let key = key {
                self.setTitle(NSLocalizedString(key, comment: ""), for: self.state)
            }
        }
    }
}

extension UITabBarItem: Localizable {
    @IBInspectable var localizedKey: String? {
        get { return nil }
        set(key) {
            if let key = key {
                self.title = NSLocalizedString(key, comment: "")
            }
        }
    }
}

// MARK: - Strings extension
public struct Strings {}
//*** 標題底線後以大寫為開頭，一般句子底線後以小寫為開頭 ***//

// MARK: - General
extension Strings {
    public static let username = NSLocalizedString("username", comment: "")
    public static let password = NSLocalizedString("password", comment: "")
    public static let ok = NSLocalizedString("ok", comment: "")
    public static let cancel = NSLocalizedString("cancel", comment: "")
    public static let value_filter = NSLocalizedString("value_filter", comment: "")
    public static let value_info = NSLocalizedString("value_info", comment: "")
    public static let distribution = NSLocalizedString("distribution", comment: "")
    public static let stockholders = NSLocalizedString("stockholders", comment: "")
    public static let invest_news = NSLocalizedString("invest_news", comment: "")
    public static let connect = NSLocalizedString("connect", comment: "")

    public static let app_name = NSLocalizedString("app_name", comment: "")

    public static let nft = NSLocalizedString("nft", comment: "")
    
    public static let waiting = NSLocalizedString("waiting", comment: "")
    public static let confirm_password = NSLocalizedString("confirm_password", comment: "")
    public static let register = NSLocalizedString("register", comment: "")
    public static let email = NSLocalizedString("email", comment: "")
    public static let login = NSLocalizedString("login", comment: "")
    public static let logout = NSLocalizedString("logout", comment: "")
    public static let slogan = NSLocalizedString("slogan", comment: "")
    public static let agree_privacy_policy = NSLocalizedString("agree_privacy_policy", comment: "")
    public static let auto_login = NSLocalizedString("auto_login", comment: "")
    public static let no_internet = NSLocalizedString("no_internet", comment: "")

    
    public static let agree_no_responsibility = NSLocalizedString("agree_no_responsibility", comment: "")
    public static let delete_widget_item_question = NSLocalizedString("delete_widget_item_question", comment: "")
    public static let agree = NSLocalizedString("agree", comment: "")
    public static let agree_detail = NSLocalizedString("agree_detail", comment: "")
    public static let free_register = NSLocalizedString("free_register", comment: "")
    public static let forget_password = NSLocalizedString("forget_password", comment: "")
    public static let modify_password = NSLocalizedString("modify_password", comment: "")
    public static let no_responsibility = NSLocalizedString("no_responsibility", comment: "")
    public static let set_widget = NSLocalizedString("set_widget", comment: "")
    public static let k_filter = NSLocalizedString("k_filter", comment: "")
    public static let update_level = NSLocalizedString("update_level", comment: "")
    public static let update = NSLocalizedString("update", comment: "")
    public static let line_group = NSLocalizedString("line_group", comment: "")


    public static let sex = NSLocalizedString("sex", comment: "")
    public static let man = NSLocalizedString("man", comment: "")
    public static let woman = NSLocalizedString("woman", comment: "")
    public static let open_gallery = NSLocalizedString("open_gallery", comment: "")
    public static let open_camera = NSLocalizedString("open_camera", comment: "")
    public static let phone = NSLocalizedString("phone", comment: "")
    public static let birthday = NSLocalizedString("birthday", comment: "")
    public static let save = NSLocalizedString("save", comment: "")
    public static let save_success = NSLocalizedString("save_success", comment: "")
    public static let my_favorite = NSLocalizedString("my_favorite", comment: "")
    public static let international = NSLocalizedString("international", comment: "")
    public static let market_info = NSLocalizedString("market_info", comment: "")

    public static let internationalData = NSLocalizedString("internationalData", comment: "")
    public static let skip = NSLocalizedString("skip", comment: "")

    public static let settings = NSLocalizedString("settings", comment: "")
    public static let back = NSLocalizedString("back", comment: "")
    public static let level1 = NSLocalizedString("level1", comment: "")
    public static let level2 = NSLocalizedString("level2", comment: "")
    public static let level3 = NSLocalizedString("level3", comment: "")
    public static let level4 = NSLocalizedString("level4", comment: "")


    public static let all = NSLocalizedString("all", comment: "")

    public static let morning_star_cross = NSLocalizedString("morning_star_cross", comment: "")
    public static let night_star_cross = NSLocalizedString("night_star_cross", comment: "")
    public static let red_three_soldiers = NSLocalizedString("red_three_soldiers", comment: "")
    public static let black_three_soldiers = NSLocalizedString("black_three_soldiers", comment: "")
    public static let red_K_swallowed = NSLocalizedString("red_K_swallowed", comment: "")
    public static let black_K_swallowed = NSLocalizedString("black_K_swallowed", comment: "")
    public static let double_T = NSLocalizedString("double_T", comment: "")
    public static let double_reverse_T = NSLocalizedString("double_reverse_T", comment: "")
    public static let black_double_dragon = NSLocalizedString("black_double_dragon", comment: "")
    public static let red_double_dragon = NSLocalizedString("red_double_dragon", comment: "")
    public static let filter = NSLocalizedString("filter", comment: "")
    public static let filter_stock = NSLocalizedString("filter_stock", comment: "")
    
    public static let basic_info = NSLocalizedString("basic_info", comment: "")
    public static let business_status = NSLocalizedString("business_status", comment: "")
    public static let divide = NSLocalizedString("divide", comment: "")
    public static let delete = NSLocalizedString("delete", comment: "")
    public static let profile = NSLocalizedString("profile", comment: "")
    
    public static let sign_in_with_apple = NSLocalizedString("sign_in_with_apple", comment: "")
    public static let sign_in_with_google = NSLocalizedString("sign_in_with_google", comment: "")
    public static let sign_in_with_facebook = NSLocalizedString("sign_in_with_facebook", comment: "")
    public static let simulated_trading = NSLocalizedString("simulated_trading", comment: "")
    public static let rank = NSLocalizedString("rank", comment: "")

    

}

