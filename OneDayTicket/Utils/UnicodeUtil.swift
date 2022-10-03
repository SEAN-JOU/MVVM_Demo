//
//  UnicodeUtil.swift
//  Chinastockanalysis
//
//  Created by sean on 2021/11/23.
//  Copyright © 2021 Jou Sean. All rights reserved.
//
import Foundation
import CommonCrypto
import CryptoKit


class UnicodeUtil:NSObject{
    
    static func stringToUnicode(str:String)-> String {
        var string:String = ""
        for index in 0...str.count-1{
            var ss:String = String(Array(str)[index])
            if let data = ss.data(using: String.Encoding.nonLossyASCII, allowLossyConversion: false) {
                if let convertedString = String(data: data, encoding: String.Encoding.utf8) {
                    if(convertedString.contains("\\u")){
                        string.append(convertedString)
                    }else{
                        var ss: UnicodeScalar = convertedString.unicodeScalars.first!
                        string.append("\\u" + String(ss.value, radix: 16))
                    }
                }
            }
        }
        return string
    }
    
    
    static func unicodeToString(str:String) -> String {
        var string:String = ""
        var array = str.split(separator: "u")
        for index in 0...array.count-1{
            if(array[index] != "" || array[index] != nil){
                string.append(String("\\u"+array[index]))
            }
        }
        let tempStr1 = string.replacingOccurrences(of: "\\u", with: "\\U")
        let tempStr2 = tempStr1.replacingOccurrences(of: "\"", with: "\\\"")
        let tempStr3 = "\"".appending(tempStr2).appending("\"")
        let tempData = tempStr3.data(using: String.Encoding.utf8)
        var returnStr:String = ""
        do {
            returnStr = try PropertyListSerialization.propertyList(from: tempData!, options: [.mutableContainers], format: nil) as! String
        } catch {
            print(error)
        }
        return returnStr.replacingOccurrences(of: "\\r\\n", with: "\n")
    }
}

extension UnicodeScalar {
    var codePointString: String {
        return "U+\(String(self.value, radix: 16))"
    }
}
