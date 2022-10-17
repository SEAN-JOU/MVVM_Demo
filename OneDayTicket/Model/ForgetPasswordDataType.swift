//
//  Data.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import Foundation

public struct ForgetPasswordDataType : Codable{
    
     var sysCode: Int!
     var sysMsg: String!
     var data: ForgetPasswordDataContent!
        
    struct ForgetPasswordDataContent : Codable{
        var authcode : String!
   }
}
