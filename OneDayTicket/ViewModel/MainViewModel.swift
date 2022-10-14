//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class MainViewModel {
    
    var vc:MainViewController?
    
    func initViewModel(vc:MainViewController){
        self.vc = vc
    }
    
    func getdata(memberID:String){
            ApiClient.getdata(memberID: memberID, complete: { (data) in
                let decoder = JSONDecoder()
                if let mainData = try? decoder.decode(MainDataType.self, from: data!){
                    self.vc?.getdataCallBack(mainData: mainData)
                }
            }
        )
    }
}
