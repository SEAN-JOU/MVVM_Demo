import Foundation
import NYAlertViewController
import Network
import UIKit
import NVActivityIndicatorView

var loadingView:NVActivityIndicatorView?

class BaseViewController: UIViewController{
    
    var isClick: Bool = true{
       didSet{
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.isClick = true
           }
       }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let frame = CGRect(x: self.view.frame.width/2-25, y: self.view.frame.height/2-25, width: 50, height: 50)
        loadingView = NVActivityIndicatorView(frame: frame,type: .ballGridPulse,color: .red)
        self.view.addSubview(loadingView!)
    }
    
    func alert(string:String){
        UIAlertController.showOkAlertBox(title:string,vc: self)
    }
}
