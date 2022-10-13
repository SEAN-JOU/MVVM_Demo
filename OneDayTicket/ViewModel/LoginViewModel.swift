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
                if let loginData = try? decoder.decode(LoginDataType.self, from: data!){
                    self.vc?.callback(loginData: loginData)
                }
            }
        )
    }
}
