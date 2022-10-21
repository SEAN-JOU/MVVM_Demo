//
//  Data.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import Foundation

public struct MotifyPasswordDataType : Codable{
    
    var sysCode: Int!
    var sysMsg: String!
    var data: MotifyDataContent!
       
   struct MotifyDataContent : Codable{
       var account : String!
       var session_id : String!
       var member_guid : String!
       var member_type : Int!
       var account_name : String!
       var expired_time : String!
       var member_name: NameDataType!
  }
   struct NameDataType : Codable{
       var en_US : String!
       var zh_TW : String!
   }
}
