//
//  MotifyPasswordViewController.swift
//  onedayticket-ios
//
//  Created by Sean on 2022/10/14.
//

import Foundation
import UIKit


class MotifyPasswordViewController: BaseViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var motifyButton: UIButton!
    var motifyPasswordViewModel = MotifyPasswordViewModel()
    var authcode : String!
    var isFirst : Bool!
    @IBOutlet weak var randomTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var againPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomTextField.delegate = self
        newPasswordTextField.delegate = self
        againPasswordTextField.delegate = self
        
        motifyPasswordViewModel.initViewModel(vc: self)
        backButton.setOnClickListener {
            self.dismiss(animated: true)
        }
        
        if(isFirst){
            randomTextField.isHidden = true
        }else{
            randomTextField.isHidden = false
        }
        
        motifyButton.setOnClickListener {
            loadingView?.startAnimating()
            
            if(self.randomTextField.text! != nil && self.randomTextField.text! != "" && self.againPasswordTextField.text! != nil && self.againPasswordTextField.text! != "" && self.newPasswordTextField.text! != nil && self.newPasswordTextField.text! != ""){
                if(self.againPasswordTextField.text == self.newPasswordTextField.text){
                    if(self.isClick){
                        self.isClick = false
                        self.motifyPasswordViewModel.resetPassword(authcode: self.authcode, newPassword: self.newPasswordTextField.text!, randNumber: self.randomTextField.text!)
                    }
                }else{
                    UIAlertController.showOkAlertBox(title:"密碼不一致",vc: self)
                    loadingView?.stopAnimating()
                }
            }else{
                UIAlertController.showOkAlertBox(title:"輸入框不得為空",vc: self)
                loadingView?.stopAnimating()
            }
        }
    }
}

extension MotifyPasswordViewController:MotifyPasswordDelegate {
    func resetPasswordCallBack(motifyPasswordDataType: MotifyPasswordDataType) {
        DispatchQueue.main.async {
            loadingView?.stopAnimating()
        }
        if(motifyPasswordDataType.sysCode >= 0){
            DispatchQueue.main.async {
                UserDefault.setValue(key: "password", value: "")
                UIAlertController.showUpdateAlertBox(title:"修改成功",buttonName:"返回登入頁",vc: self,okHandler:{_ in
                    DispatchQueue.main.async {
                        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        vc1.modalPresentationStyle = .fullScreen
                        self.present(vc1, animated: true, completion: nil)
                    }
                })
            }
        }else{
            DispatchQueue.main.async {
                switch motifyPasswordDataType.sysCode {
                case -1:
                    UIAlertController.showOkAlertBox(title:"未登入或session已過期",vc: self)
                    break
                case -2:
                    UIAlertController.showOkAlertBox(title:"商店被停用",vc: self)
                    break
                case -3:
                    UIAlertController.showOkAlertBox(title:"帳號被系統管理者鎖定",vc: self)
                    break
                case -14:
                    UIAlertController.showOkAlertBox(title:"驗證碼已使用",vc: self)
                    break
                case -15:
                    UIAlertController.showOkAlertBox(title:"驗證碼錯誤",vc: self)
                    break
                default: break
                }
            }
        }
    }
}

extension MotifyPasswordViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



