

import UIKit
import Kingfisher


class MainViewController:UITabBarController, UINavigationControllerDelegate{
    
    @IBOutlet weak var mainTabBar: CustomTabBar!
    var mainViewModel = MainViewModel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func alert(string:String){
        UIAlertController.showOkAlertBox(title:string,vc: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(UIScreen.main.nativeBounds.height > 1400){
            mainTabBar.height = 100.0
            Log.d(title: "aaaaa", message: "b1")
        }else{
            mainTabBar.height = 70.0
            Log.d(title: "aaaaa", message: "b2")
        }
        
        mainViewModel.initViewModel(vc: self)
        mainViewModel.getdata(memberID: UserDefault.getValue(key: "memberID") as! String)
        self.navigationItem.rightBarButtonItems![0] = UIBarButtonItem.menuButton(self, action: #selector(self.moveToNotifyVC), imageName: "ic_notifications")
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
}


extension MainViewController:MainDelegate {
    func getdataCallBack(mainData: MainDataType) {
        DispatchQueue.main.async {
            self.navigationItem.title = mainData.data.member_name.zh_TW
            if(mainData.data.renew_password){
//                DispatchQueue.main.async {
//                    let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MotifyPasswordViewController") as! MotifyPasswordViewController
//                    vc1.modalPresentationStyle = .fullScreen
//                    vc1.isFirst = true
//                    self.present(vc1, animated: true, completion: nil)
//                }
            }
            if let imageURLString = mainData.data.logo_url {
                if imageURLString == "" { return }
                let imageURL = URL(string: imageURLString)!
                let resource = ImageResource(downloadURL: imageURL)
                KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                      switch result {
                      case .success(let value):
                          let button = UIButton()
                          button.imageView?.contentMode = .scaleAspectFill
                          button.imageView?.layer.cornerRadius = 14
                          button.translatesAutoresizingMaskIntoConstraints = false
                          button.setImage(value.image.resizeImage(targetSize: CGSize(width: 25, height: 25)).withRenderingMode(.alwaysOriginal), for: .normal)
                          button.widthAnchor.constraint(equalToConstant: 28).isActive = true
                          button.heightAnchor.constraint(equalToConstant: 28).isActive = true
//                          button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
                          self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
                          break
                      case .failure(let error):
                          break
                      }
                  }
            }
        }
    }
    @objc func moveToNotifyVC() {
        
    }
}





