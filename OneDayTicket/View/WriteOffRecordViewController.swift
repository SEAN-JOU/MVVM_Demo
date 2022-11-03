
//
//  Created by hangge on 16/1/19.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class WriteOffRecordViewController: UIViewController {
    
    @IBOutlet weak var qrcodeBtn: UIButton!

    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        qrcodeBtn.setOnClickListener {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
