
//
//  Created by hangge on 16/1/19.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class WriteOffViewController: BaseViewController {
    
    @IBOutlet weak var backQRButton: UIButton!
    @IBOutlet weak var writeoffButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backQRButton.setOnClickListener {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
        writeoffButton.setOnClickListener {
            DispatchQueue.main.async {
                UIAlertController.showOkCancelAlertBox(title: "請確認是否核銷選取的項目？",message: "",vc: self,okHandler: { (_) in
                    self.view.showToast(text: "核銷成功")
                    loadingView?.startAnimating()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)  {
                        loadingView?.stopAnimating()
                        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
                        vc1.modalPresentationStyle = .fullScreen
                        self.present(vc1, animated: true, completion: nil)
                    }
                })
            }
        }
    }
}
