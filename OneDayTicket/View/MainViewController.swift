

import UIKit


class MainViewController:UITabBarController, UINavigationControllerDelegate{
    
    var mainViewModel = MainViewModel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func alert(string:String){
        UIAlertController.showOkAlertBox(title:string,vc: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.initViewModel(vc: self)
        mainViewModel.getdata(memberID: UserDefault.getValue(key: "memberID") as! String)
//        navigationItem.leftBarButtonItems![0] = UIBarButtonItem.menuButton(self, action: #selector(moveToNotifyVC), imageName: "chevron_left")
        navigationItem.title = Strings.login_title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for i in 0 ..< self.tabBar.items!.count {
            switch i {
            case 0:
                tabBar.items?[0].title = Strings.package_info
                let firstTab = self.tabBar.items![i] as UITabBarItem
                firstTab.image = UIImage(named: "tickets")!.resizeImage(targetSize: CGSize(width: 40, height: 40)).withRenderingMode(.alwaysOriginal)
                firstTab.selectedImage = UIImage(named: "tickets_b")!.resizeImage(targetSize: CGSize(width: 40, height: 40)).withRenderingMode(.automatic)
                firstTab.imageInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
                firstTab.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            case 1:
                tabBar.items?[1].title = Strings.write_off_record
                let firstTab = self.tabBar.items![i] as UITabBarItem
                firstTab.image = UIImage(named: "writeoff")!.resizeImage(targetSize: CGSize(width: 40, height: 40)).withRenderingMode(.alwaysOriginal)
                firstTab.selectedImage = UIImage(named: "writeoff_b")!.resizeImage(targetSize: CGSize(width: 40, height: 40)).withRenderingMode(.automatic)
                firstTab.imageInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
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


extension MainViewController:MainDelegate {
    func getdataCallBack(mainData: MainDataType) {
        
    }
}





