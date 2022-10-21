//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class LoginViewModel {
    var vc:LoginViewController?
    
    func initViewModel(vc:LoginViewController){
        self.vc = vc
    }
    
    func login(memberID:String,password:String){
            ApiClient.login(memberID: memberID, password: password, complete: { (data) in
                let decoder = JSONDecoder()
                do {
                    let loginData = try decoder.decode(LoginDataType.self, from: data!)
                    if(loginData.sysCode != nil){
                        self.vc?.loginCallBack(loginData: loginData)
                    }else{
                        DispatchQueue.main.async {
                            self.vc?.alert(string: Strings.format_error)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.vc?.alert(string: Strings.format_error)
                    }
                }
            }
        )
    }
}
