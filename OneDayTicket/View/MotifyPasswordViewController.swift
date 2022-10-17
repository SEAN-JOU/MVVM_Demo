//
//  MotifyPasswordViewController.swift
//  onedayticket-ios
//
//  Created by Sean on 2022/10/14.
//

import Foundation

//
//  ForgetPasswordViewController.swift
//  Chinastockanalysis
//
//  Created by sean on 2021/10/7.
//  Copyright © 2021 Jou Sean. All rights reserved.
//

import UIKit

class MotifyPasswordViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    var authcode : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.setOnClickListener {
            self.dismiss(animated: true)
        }
    }
}


extension MotifyPasswordViewController:UITextFieldDelegate {
    
    // 當按下右下角的return鍵時觸發
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



