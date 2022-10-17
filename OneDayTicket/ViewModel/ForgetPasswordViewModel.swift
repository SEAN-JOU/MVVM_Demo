//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class ForgetPasswordViewModel {
    var vc:ForgetPasswordViewController?
    
    func initViewModel(vc:ForgetPasswordViewController){
        self.vc = vc
    }
    
    func login(memberID:String,email:String){
            ApiClient.forget(memberID: memberID, email: email, complete: { (data) in
                let decoder = JSONDecoder()
                if let forgetPasswordDataType = try? decoder.decode(ForgetPasswordDataType.self, from: data!){
                    
                }
            }
        )
    }
}
