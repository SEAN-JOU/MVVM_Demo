//
//  DataViewModel.swift
//  MVVMSample
//
//  Created by Antonio Corrales on 26/6/18.
//  Copyright © 2018 DesarrolloManzana. All rights reserved.
//

import UIKit

class ScannerViewModel {
    var vc:ScannerViewController?
    
    func initViewModel(vc:ScannerViewController){
        self.vc = vc
    }
    
    func getticketinfo(memberID:String,qrcode_data:String,session:String){
        ApiClient.getticketinfo(memberID:memberID,qrcode_data:qrcode_data,session:session, complete: { (data) in
            let decoder = JSONDecoder()
            do {
                let scannerData = try decoder.decode(ScannerDataType.self, from: data!)
                if(scannerData.sysCode != nil){
                    self.vc?.getticketinfo(scannerData: scannerData)
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
        })
    }
}
