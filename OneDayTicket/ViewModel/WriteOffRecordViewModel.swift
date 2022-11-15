//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class WriteOffRecordViewModel {
    
    var vc:WriteOffViewController?
    
    func initViewModel(vc:WriteOffViewController){
        self.vc = vc
    }
    
    func getdata(memberID:String){
            ApiClient.getdata(memberID: memberID, complete: { (data) in
                let decoder = JSONDecoder()
                do {
                    let mainData = try decoder.decode(MainDataType.self, from: data!)
                    if(mainData.sysCode != nil){
                        
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
