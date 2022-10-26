//
//  ScannerDataType.swift
//  onedayticket-ios
//
//  Created by Sean on 2022/10/26.
//

import Foundation

public struct ScannerDataType: Codable{
    
    var sysCode: Int!
    var sysMsg: String!
    var data: [ScannerDataContent]!
       
   struct ScannerDataContent : Codable{
       var ticket_num : String!
       var item_sum : Int!
       var merchant_item : [ScannerDataItemContent]!
  }
    
    struct ScannerDataItemContent : Codable{
        var merchant_subitem : String!
        var merchant_subitem_name : String!
        var unit : Int!
        var stock : Int!
   }
}
