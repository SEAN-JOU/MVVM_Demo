//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class LoginViewModel {
    
    
    var vc:UIViewController?
    
    func initViewModel(vc:UIViewController){
        self.vc = vc
    }
    
    func login(memberID:String,password:String){
        ApiClient.login(memberID: memberID, password: password, complete: { (data) in
            let decoder = JSONDecoder()
            if let loginData = try? decoder.decode(LoginDataType.self, from: data!) {
                if(loginData.sysCode >= 0){
                    DispatchQueue.main.async {
                        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                        vc1.modalPresentationStyle = .fullScreen
                        self.vc!.present(vc1, animated: true, completion: nil)
                    }
                }else{
                    DispatchQueue.main.async {
                        switch loginData.sysCode {
                        case -1:
                            UIAlertController.showOkAlertBox(title:"帳號不存在",vc: self.vc!)
                            break
                        case -2:
                            UIAlertController.showOkAlertBox(title:"帳號密碼不正確",vc: self.vc!)
                            break
                        case -3:
                            UIAlertController.showOkAlertBox(title:"帳號未啟用",vc: self.vc!)
                            break
                        case -4:
                            UIAlertController.showOkAlertBox(title:"帳號被系統管理者鎖定",vc: self.vc!)
                            break
                        case -5:
                            UIAlertController.showOkAlertBox(title:"找不到對應的會員資料",vc: self.vc!)
                            break
                        case -6:
                            UIAlertController.showOkAlertBox(title:"會員未啟用",vc: self.vc!)
                            break
                        case -7:
                            UIAlertController.showOkAlertBox(title:"會員已被系統管理者鎖定",vc: self.vc!)
                            break
                        default: break
                        }
                    }
                }
            }
        }
        )
    }
}

struct DataListCellViewModel {
    let titleText: String
    let subTitleText: String
}
