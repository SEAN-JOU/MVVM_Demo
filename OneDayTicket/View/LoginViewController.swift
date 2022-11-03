
import UIKit


class LoginViewController: BaseViewController{
    
    @IBOutlet weak var memberIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var rememberCheckBox: CheckBox!
    @IBOutlet weak var forgetpasswordBtn: UIButton!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberIDTextField.delegate = self
        passwordTextField.delegate = self
        loginViewModel.initViewModel(vc: self)
        
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        versionLabel.text = "v " + appVersion!
        loginButton.accessibilityIdentifier = "loginButton"
//        loginViewModel.getVersion()
        
        if(UserDefault.getValue(key: "password") as? String != nil && UserDefault.getValue(key: "password") as? String != ""){
            rememberCheckBox.isChecked = true
            passwordTextField.text = UserDefault.getValue(key: "password") as? String
        }
        
        if(UserDefault.getValue(key: "memberID") as? String != nil && UserDefault.getValue(key: "memberID") as? String != ""){
            memberIDTextField.text = UserDefault.getValue(key: "memberID") as? String
        }
        
        rememberCheckBox.setOnClickListener {
            if(!self.rememberCheckBox.isChecked){
                UserDefault.setValue(key: "password", value: "")
                self.passwordTextField.text! = ""
            }
        }
        forgetpasswordBtn.setOnClickListener {
            let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordViewController") as! ForgetPasswordViewController
            vc1.modalPresentationStyle = .fullScreen
            self.present(vc1, animated: true, completion: nil)
        }
    }
    
    @objc private func loginTapped() {
        if(memberIDTextField.text! != nil && memberIDTextField.text! != "" && passwordTextField.text! != nil && passwordTextField.text! != ""){
            loadingView?.startAnimating()
            loginViewModel.login(memberID: memberIDTextField.text!, password: passwordTextField.text!)
            UserDefault.setValue(key: "memberID", value: memberIDTextField.text!)
            if(rememberCheckBox.isChecked){
                UserDefault.setValue(key: "password", value: passwordTextField.text!)
            }
        }else{
            UIAlertController.showOkAlertBox(title:"輸入框不得為空",vc: self)
        }
    }
}

extension LoginViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController:LoginDelegate {
    func versionCallBack(versionData: VersionDataType) {
        if(versionData.sysCode >= 0){
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            if appVersion!.compare(versionData.data.ios_version, options: .numeric) == .orderedAscending{
                if(versionData.data.android_need_update){
                    DispatchQueue.main.async {
                        UIAlertController.showUpdateAlertBox(title: "版本更新",message: "前往App Store更新Oride套票管理平台",vc: self,okHandler: { (_) in
                            if let url = URL(string: versionData.data.ios_app_path), UIApplication.shared.canOpenURL(url) {
                                if #available(iOS 10.0, *) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url)
                                }
                            }
                        })
                    }
                }else{
                    DispatchQueue.main.async {
                        UIAlertController.showUpdateCancelAlertBox(title: "版本更新",message: "前往App Store更新Oride套票管理平台",vc: self,okHandler: { (_) in
                            if let url = URL(string: versionData.data.ios_app_path), UIApplication.shared.canOpenURL(url) {
                                if #available(iOS 10.0, *) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url)
                                }
                            }
                        })
                    }
                }
            }
        }
    }
    
    func loginCallBack(loginData: LoginDataType) {
            DispatchQueue.main.async {
                loadingView?.stopAnimating()
            }
            if(loginData.sysCode >= 0){
                DispatchQueue.main.async {
                    UserDefault.setValue(key: "session", value: loginData.data.session_id)
                    let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
                    vc1.modalPresentationStyle = .fullScreen
                    self.present(vc1, animated: true, completion: nil)
                }
            }else{
                DispatchQueue.main.async {
                    switch loginData.sysCode {
                    case -1:
                        UIAlertController.showOkAlertBox(title:"帳號不存在",vc: self)
                        break
                    case -2:
                        UIAlertController.showOkAlertBox(title:"帳號密碼不正確",vc: self)
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
                    default: break
                    }
                }
            }
    }
}
