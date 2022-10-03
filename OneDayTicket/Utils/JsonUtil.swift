//
//  JsonUtils.swift
//  Chinastockanalysis
//
//  Created by sean on 2021/12/1.
//  Copyright © 2021 Jou Sean. All rights reserved.
//

import UIKit
import Foundation
import CommonCrypto
import CryptoKit


class JsonUtil:NSObject{
    
    static func jsonString(from object:Any) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return ""
        }
        return String(data: data, encoding: String.Encoding.utf8)!
    }
    
    static func forMessageJsonString(uuid:String,text:String,imageurl:String,date:String) -> String {
        do {
            return "{\"uuid\":\""+uuid+"\","+"\"text\":\""+text+"\","+"\"date\":\""+date+"\","+"\"imageurl\":\""+imageurl+"\"}"
        } catch let myJSONError {
            print(myJSONError)
        }
        return ""
    }
    
    static func jsonToString(stockcode:String,stockname:String,type:String) -> String {
        do {
            return "{\"stockcode\":\""+stockcode+"\","+"\"stockname\":\""+stockname+"\","+"\"type\":\""+type+"\"}"
        } catch let myJSONError {
            print(myJSONError)
        }
        return ""
    }
    
  
    
    static func stringToJsonArrayforFilter(string:String) -> [Any] {
        let decoder = JSONDecoder()
        var s :String = string.replacingOccurrences(of: "[[", with: "")
        var a1 :String = s.replacingOccurrences(of: "]]", with: "")
        var splitString : String = "],["
        var dd = a1.components(separatedBy: splitString)
        return dd
    }
    
    
    
}
