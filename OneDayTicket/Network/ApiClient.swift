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
    
    static func login( memberID:String,password:String,complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/login.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["memberID": memberID, "password": password]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data,response,error
            in guard let data = data,let dataString = String(data: data, encoding: .utf8),
                     let response = response as? HTTPURLResponse,
                     error == nil else {
                         return
                     }
            complete(data)
        }
        task.resume()
    }
    
    static func forget(memberID:String,email:String,complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/forget.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["memberID": memberID, "email": email]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data,response,error
            in guard let data = data,let dataString = String(data: data, encoding: .utf8),
                     let response = response as? HTTPURLResponse,
                     error == nil else {
                         return
                     }
            complete(data)
        }
        task.resume()
    }
    
    static func getdata(memberID:String,complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/getdata.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["memberID": memberID, "session": UserDefault.getValue(key:"session_id") as! String]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data,response,error
            in guard let data = data,let dataString = String(data: data, encoding: .utf8),
                     let response = response as? HTTPURLResponse,
                     error == nil else {
                         return
                     }
            complete(data)
        }
        task.resume()
    }
}
