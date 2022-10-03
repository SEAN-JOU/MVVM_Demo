

import UIKit



class LoginViewController: UIViewController{
    
    
    @IBOutlet weak var memberIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.initViewModel(vc: self)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        loginViewModel.login(memberID: memberIDTextField.text!, password: passwordTextField.text!)
    }
}
