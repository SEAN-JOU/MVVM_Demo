//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class MotifyPasswordViewModel {
    var vc:MotifyPasswordViewController?
    
    func initViewModel(vc:MotifyPasswordViewController){
        self.vc = vc
    }
    
    func resetPassword(authcode:String,newPassword:String,randNumber:String){
        ApiClient.resetPassword(authcode: authcode, newPassword: newPassword, randNumber: randNumber, complete: { (data) in
            let decoder = JSONDecoder()
            do {
                let motifyDataType = try decoder.decode(MotifyDataType.self, from: data!)
                if(motifyDataType.sysCode != nil){
                    self.vc?.resetPasswordCallBack(motifyDataType: motifyDataType)
                }else{
                    DispatchQueue.main.async {
                        self.vc?.alert(string: Strings.format_error)
                    }
                }
            } catch {
                self.vc?.alert(string: Strings.format_error)
            }
        })
    }
}
