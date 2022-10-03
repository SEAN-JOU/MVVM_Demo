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
    

    
//    func getData(){
//        ApiClient.login(complete: <#T##(Bool, [Data]?) -> ()##(Bool, [Data]?) -> ()##(_ success: Bool, _ data: [Data]?) -> ()#>) { (success, data) in
//           
//        }
//    }
}

struct DataListCellViewModel {
    let titleText: String
    let subTitleText: String
}
