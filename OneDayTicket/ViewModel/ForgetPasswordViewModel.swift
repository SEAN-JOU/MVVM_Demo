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
    
    func forget(memberID:String,email:String){
            ApiClient.forget(memberID: memberID, email: email, complete: { (data) in
                let decoder = JSONDecoder()
                do {
                    let forgetPasswordDataType = try decoder.decode(ForgetPasswordDataType.self, from: data!)
                    if(forgetPasswordDataType.sysCode != nil){
                        self.vc?.forgetCallBack(forgetPasswordData: forgetPasswordDataType)
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
