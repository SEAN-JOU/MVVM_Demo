
//
//  Created by hangge on 16/1/19.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//            vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//            self.present(vc, animated: true, completion: nil)
        }
    }
    
  
}
