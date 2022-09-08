//
//  StringExtension.swift
//  BizCloud-SI
//
//  Created by on
//  Copyright © 2016年. All rights reserved.
//

import Foundation

extension String {
    
    func base64Encoded() -> String {
        let plainData = data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue:0))
        return base64String!
    }
    
    func base64Decoded() -> String {
        let decodedData = Data(base64Encoded: self, options:NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        let decodedString = NSString(data: decodedData!, encoding: String.Encoding.utf8.rawValue)
        return decodedString! as String
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func index(from: Int) -> Index {
            return self.index(startIndex, offsetBy: from)
        }

        func substring(from: Int) -> String {
            let fromIndex = index(from: from)
            return String(self[fromIndex...])
        }

        func substring(to: Int) -> String {
            let toIndex = index(from: to)
            return String(self[..<toIndex])
        }

  
    func getTimeStringFromUnixTime() -> String {
        var retStr = ""
        if Double(self) != nil {
            let date = Date(timeIntervalSince1970: (Double(self)! / 1000) )
            
            // Returns date formatted as 12 hour time.
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            retStr = dateFormatter.string(from: date)
        }
        return retStr
    }
    
    func getDayStringFromTime() -> String {
        var retStr = ""
        if Double(self) != nil {
            let date = Date(timeIntervalSince1970: Double(self)!)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: Locale.current.identifier)
            dateFormatter.dateFormat = "EEEE"
            retStr = dateFormatter.string(from: date)
        }
        return retStr
    }
    
    var localizedString : String {
        let localizeString = NSLocalizedString(self, comment: self)
        //        if localizeString == self {
        //            let path = Bundle.main.path(forResource: "zh-Hant", ofType: "lproj")
        //            localizeString = NSLocalizedString(self, tableName: nil, bundle: Bundle(path: path!)!, value: self, comment: self)
        //        }
        return localizeString
    }
    
    var isNumber: Bool {
           return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
       }
}
