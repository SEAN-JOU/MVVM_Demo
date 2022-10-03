//
//  UserDefault.swift
//  Chinastockanalysis
//
//  Created by Jou Sean on 2019/10/13.
//  Copyright © 2019 Jou Sean. All rights reserved.
//

import Foundation

class UserDefault
{
    static let defaults = UserDefaults(suiteName: "group.com.siang.chithink")
    
    static func setValue(key: String, value: Any) {
        defaults!.set(value, forKey: key)
        defaults!.synchronize()
    }
    
    static func getValue(key: String) -> Any? {
        return defaults!.object(forKey: key)
    }
    
    static func clearAllUserDefaultsData()
    {
        let dics = defaults!.dictionaryRepresentation()
        for key in dics {
            defaults!.removeObject(forKey: key.key)
        }
        defaults!.synchronize()
    }
}
