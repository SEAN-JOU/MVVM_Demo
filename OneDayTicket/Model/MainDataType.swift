//
//  Data.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import Foundation

public struct MainDataType : Codable{
    
     var sysCode: Int!
     var sysMsg: String!
     var data: MainDataContent!
        
    struct MainDataContent : Codable{
        var session : String!
        var expired_time : String!
   }
}
