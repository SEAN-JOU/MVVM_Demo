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
                Log.d(title: "aaaaaa", message: String(data: data!, encoding: .utf8))
                do {
                    let mainData = try decoder.decode(MainDataType.self, from: data!)
                    if(mainData.sysCode != nil){
                        self.vc?.getdataCallBack(mainData: mainData)
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
