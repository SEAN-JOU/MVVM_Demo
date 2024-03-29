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
    
    static func getticketinfo(memberID:String,qrcode_data:String,session:String,complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/getticketinfo.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["memberID": memberID, "qrcode_data": qrcode_data, "session": session]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data,response,error
            in guard let data = data,let dataString = String(data: data, encoding: .utf8),
                     let response = response as? HTTPURLResponse,
                     error == nil else {
                         return
                     }
            Log.d(title: "aaaaaaa", message: dataString)
            complete(data)
        }
        task.resume()
    }
    
    static func login( memberID:String,password:String,complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/login.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["memberID": memberID, "password": (memberID+password).md5]
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
    
    static func getVersion(complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/getversion.php")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
            } else {
                if let response = response as? HTTPURLResponse {
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    let decoder = JSONDecoder()
                        
                    }
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
                            DispatchQueue.main.async {
                                loadingView?.stopAnimating()
                            }
                         return
                     }
            complete(data)
        }
        task.resume()
    }
    
    static func resetPassword(authcode:String,newPassword:String,randNumber:String,complete: @escaping (_ data: Data? )->() ){
        let url = URL(string: API_URL + "/merchant/reset_passwd.php")!
        var request = URLRequest(url: url)
        request.timeoutInterval = 2
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = ["authcode": authcode, "rand_num": randNumber, "new_password": (UserDefault.getValue(key: "memberID") as! String+newPassword).md5]
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
        let parameters: [String: Any] = ["memberID": memberID, "session": UserDefault.getValue(key:"session") as! String]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data,response,error
            in guard let data = data,let dataString = String(data: data, encoding: .utf8),
                     let response = response as? HTTPURLResponse,
                     error == nil else {
                         return
                     }
            Log.d(title: "aaaaaa", message: dataString)
            complete(data)
        }
        task.resume()
    }
}
