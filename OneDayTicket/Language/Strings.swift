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
    public static let login_title = NSLocalizedString("login_title", comment: "")
    public static let login = NSLocalizedString("login", comment: "")
    public static let forget_password = NSLocalizedString("forget_password", comment: "")
    public static let remember_password = NSLocalizedString("remember_password", comment: "")
    public static let ok = NSLocalizedString("ok", comment: "")
    public static let cancel = NSLocalizedString("cancel", comment: "")
    
    public static let package_info = NSLocalizedString("package_info", comment: "")
    public static let update = NSLocalizedString("update", comment: "")
    public static let write_off_record = NSLocalizedString("write_off_record", comment: "")

    
    
    

}

