

import UIKit


class LoginViewController: UIViewController{
    
    @IBOutlet weak var memberIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var versionLabel: UILabel!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.initViewModel(vc: self)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        versionLabel.text = "v " + appVersion!
    }
    
    @objc private func loginTapped() {
        if(memberIDTextField.text! != nil && memberIDTextField.text! != "" && passwordTextField.text! != nil && passwordTextField.text! != ""){
                loginViewModel.login(memberID: memberIDTextField.text!, password: (memberIDTextField.text!+passwordTextField.text!).md5)
        }else{
            UIAlertController.showOkAlertBox(title:"輸入框不得為空",vc: self)
        }
    }
}
