

import UIKit



class MainViewController:UITabBarController{
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for i in 0 ..< self.tabBar.items!.count {
            switch i {
            case 0:
                tabBar.items?[0].title = Strings.market_info
                let firstTab = self.tabBar.items![i] as UITabBarItem
                firstTab.image = UIImage(named: "ic_qrcode")!.withRenderingMode(.alwaysOriginal)
                firstTab.selectedImage = UIImage(named: "ic_qrcode")!.withRenderingMode(.automatic)
                firstTab.imageInsets = UIEdgeInsets(top: 80, left: 80, bottom: 80, right: 80)
                firstTab.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            case 1:
                tabBar.items?[1].title = Strings.my_favorite
                let firstTab = self.tabBar.items![i] as UITabBarItem
                firstTab.image = UIImage(named: "ic_qrcode")!.withRenderingMode(.alwaysOriginal)
                firstTab.selectedImage = UIImage(named: "ic_qrcode")!.withRenderingMode(.automatic)
                firstTab.imageInsets = UIEdgeInsets(top: 80, left: 80, bottom: 80, right: 80)
                firstTab.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            default:
                break
            }
        }
    }
    
    @objc func moveToNotifyVC() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "NotifyViewController")
//        vc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
//        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(vc, animated: true, completion: nil)
    }
}

