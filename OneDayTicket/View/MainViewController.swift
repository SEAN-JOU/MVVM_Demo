

import UIKit



class MainViewController: UIViewController{
    
    @IBOutlet weak var scanQRButton: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scanQRTapped(tapGestureRecognizer1:)))
        scanQRButton.isUserInteractionEnabled = true
        scanQRButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func scanQRTapped(tapGestureRecognizer1: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}
