//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class LoginViewModel {
    
    var datas: [Data] = [Data]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    var vc:UIViewController?
    
    func initViewModel(vc:UIViewController){
        self.vc = vc
    }
    func login(memberID:String,password:String){
        ApiClient.login(memberID: memberID, password: memberID, complete: { (success, data1) in
            if success {
                DispatchQueue.main.async {
                    let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    vc1.modalPresentationStyle = .fullScreen
                    self.vc!.present(vc1, animated: true, completion: nil)
                }
            } else {
                
            }
        }
        )
    }
}

struct DataListCellViewModel {
    let titleText: String
    let subTitleText: String
}
