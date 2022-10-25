//
//  VersionDataType.swift
//  onedayticket-ios
//
//  Created by Sean on 2022/10/25.
//

import Foundation

public struct VersionDataType: Codable{
    
    var sysCode: Int!
    var sysMsg: String!
    var data: VersionDataContent!
       
   struct VersionDataContent : Codable{
       var ios_version : String!
       var ios_app_path : String!
       var ios_need_update : Bool!
       var android_version : String!
       var android_app_path : String!
       var android_need_update : Bool!
  }
}
