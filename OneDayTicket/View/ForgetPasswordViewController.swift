//
//  ForgetPasswordViewController.swift
//  Chinastockanalysis
//
//  Created by sean on 2021/10/7.
//  Copyright © 2021 Jou Sean. All rights reserved.
//

import UIKit


class ForgetPasswordViewController: BaseViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var memberIDTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var forgetPasswordViewModel = ForgetPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberIDTextField.delegate = self
        emailTextField.delegate = self
        forgetPasswordViewModel.initViewModel(vc: self)
        
        backButton.setOnClickListener {
            self.dismiss(animated: true)
        }
        
        sendBtn.setOnClickListener {
            loadingView?.startAnimating()
            if(self.memberIDTextField.text! != nil && self.memberIDTextField.text! != "" && self.emailTextField.text! != nil && self.emailTextField.text! != ""){
                if(self.isClick){
                    self.isClick = false
                    UserDefault.setValue(key: "memberID", value: self.memberIDTextField.text!)
                    self.forgetPasswordViewModel.forget(memberID: self.memberIDTextField!.text!, email: self.self.emailTextField!.text!)
                }
            }else{
                UIAlertController.showOkAlertBox(title:"輸入框不得為空",vc: self)
                loadingView?.stopAnimating()
           }
        }
    }
}

extension ForgetPasswordViewController:ForgetPasswordDelegate {
    func forgetCallBack(forgetPasswordData: ForgetPasswordDataType) {
        DispatchQueue.main.async {
            loadingView?.stopAnimating()
        }
        if(forgetPasswordData.sysCode >= 0){
            DispatchQueue.main.async {
                let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MotifyPasswordViewController") as! MotifyPasswordViewController
                vc1.authcode = forgetPasswordData.data.authcode
                vc1.isFirst = false
                vc1.modalPresentationStyle = .fullScreen
                self.present(vc1, animated: true, completion: nil)
            }
        }else{
            DispatchQueue.main.async {
                switch forgetPasswordData.sysCode {
                case -1:
                    UIAlertController.showOkAlertBox(title:"帳號不存在",vc: self)
                    break
                case -3:
                    UIAlertController.showOkAlertBox(title:"帳號未啟用",vc: self)
                    break
                case -4:
                    UIAlertController.showOkAlertBox(title:"帳號被系統管理者鎖定",vc: self)
                    break
                case -5:
                    UIAlertController.showOkAlertBox(title:"找不到對應的會員資料",vc: self)
                    break
                case -6:
                    UIAlertController.showOkAlertBox(title:"會員未啟用",vc: self)
                    break
                case -7:
                    UIAlertController.showOkAlertBox(title:"會員已被系統管理者鎖定",vc: self)
                    break
                case -8:
                    UIAlertController.showOkAlertBox(title:"註冊信箱不正確",vc: self)
                    break
                default: break
                }
            }
        }
    }
}

extension ForgetPasswordViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
