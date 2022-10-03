//
//  ApiClient.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

var API_URL:String = "https://api-t.oride.jwiseinc.com"


public struct ApiClient {
    
    static func login( email:String,password:String,complete: @escaping (_ success: Bool, _ data: [Data]? )->() ){
        let url = URL(string: API_URL + "/merchant/login.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["memberID": email, "password": password]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data,response,error
            in guard let data = data,
                     let response = response as? HTTPURLResponse,
                     error == nil else {
                       
                         return
                     }
        }
        task.resume()
    }
}
