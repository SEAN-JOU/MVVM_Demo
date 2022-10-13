
//
//  Created by hangge on 16/1/19.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class PackageInfoViewController: UIViewController {
    
    @IBOutlet weak var qrcodeBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Log.d(title: "aaaaa", message: "PackageInfoViewController")

        
        qrcodeBtn.setOnClickListener {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
                vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(vc, animated: true, completion: nil)
        }
    }
    
  
}
