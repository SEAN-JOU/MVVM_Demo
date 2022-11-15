
//
//  Created by hangge on 16/1/19.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class PackageInfoViewController: BaseViewController {
    
    @IBOutlet weak var qrcodeBtn: UIButton!
    @IBOutlet weak var account_name: UILabel!
    private let dotImage = UIImage(named: "ic_action_graydot")
    private let dotSelectImage = UIImage(named: "ic_action_whitedot")
    @IBOutlet weak var titleScrollView: UIView!
    var packageInfoViewModel = PackageInfoViewModel()

    
    
    private lazy var autoScrollView1: LTAutoScrollView = {
        let autoScrollView = LTAutoScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 220))
        autoScrollView.glt_timeInterval = 5
        autoScrollView.autoViewHandle = {
            return self.customAutoView1()
        }
        autoScrollView.isAutoScroll = true
        let layout = LTDotLayout(dotImage: dotImage, dotSelectImage: dotSelectImage)
        layout.dotHeight = 10.0
        autoScrollView.dotLayout = layout
        autoScrollView.backgroundColor = UIColor.white
        return autoScrollView
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        qrcodeBtn.setOnClickListener {
            OperationQueue.main.addOperation {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        account_name.text = "Hi 王大明"
        titleScrollView.backgroundColor = UIColor.white
        autoScrollView1.backgroundColor = UIColor.white
        titleScrollView.addSubview(autoScrollView1)
    }
    
    private func customAutoView1() -> [UIImageView] {
        var views = [UIImageView]()
        for index in 0 ..< 3 {
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
            imageView.backgroundColor = UIColor.white
            views.append(imageView)
            
            let label2 = UILabel(frame: CGRect(x: 150, y: 15, width: 200, height: 25))
            label2.textColor = UIColor.blue3
            label2.textAlignment = .left
            label2.backgroundColor = UIColor.white
            if(index == 0){
                label2.text = "大溪老城美食之旅"
            }else if(index == 1){
                label2.text = "桃園快車之旅"
            }else if(index == 2){
                label2.text = "美食之旅"
            }
            label2.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
            imageView.addSubview(label2)
            
            let label1 = UILabel(frame: CGRect(x: 20, y: 20, width: 110, height: 25))
            label1.textColor = UIColor.black
            label1.textAlignment = .center
            label1.backgroundColor = UIColor.white
            label1.text = "套票名稱："
            imageView.addSubview(label1)
            
            let label4 = UILabel(frame: CGRect(x: 100, y: 55, width: 200, height: 25))
            label4.textColor = UIColor.blue3
            label4.textAlignment = .center
            label4.backgroundColor = UIColor.white
            label4.text = "2022"
            label4.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
            imageView.addSubview(label4)
            
            let label3 = UILabel(frame: CGRect(x: 20, y: 60, width: 110, height: 25))
            label3.textColor = UIColor.black
            label3.textAlignment = .center
            label3.backgroundColor = UIColor.white
            label3.text = "銷售年度："
            imageView.addSubview(label3)
            
            let label6 = UILabel(frame: CGRect(x: 100, y: 95, width: 200, height: 25))
            label6.textColor = UIColor.blue3
            label6.textAlignment = .center
            label6.backgroundColor = UIColor.white
            label6.text = "3000"
            label6.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
            imageView.addSubview(label6)
            
            let label5 = UILabel(frame: CGRect(x: 20, y: 100, width: 110, height: 25))
            label5.textColor = UIColor.black
            label5.textAlignment = .center
            label5.backgroundColor = UIColor.white
            label5.text = "銷售張數："
            imageView.addSubview(label5)
            
            let label8 = UILabel(frame: CGRect(x: 100, y: 135, width: 200, height: 25))
            label8.textColor = UIColor.blue3
            label8.textAlignment = .center
            label8.backgroundColor = UIColor.white
            if(index == 0){
                label8.text = "1"
            }else if(index == 1){
                label8.text = "1"
            }else if(index == 2){
                label8.text = "0"
            }
            
            label8.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
            imageView.addSubview(label8)
            
            let label7 = UILabel(frame: CGRect(x: 20, y: 140, width: 110, height: 25))
            label7.textColor = UIColor.black
            label7.textAlignment = .center
            label7.backgroundColor = UIColor.white
            label7.text = "已核銷張數："
            imageView.addSubview(label7)
        }
        return views
    }
}

extension PackageInfoViewController:PackageInfoDelegate{
    func getticketinfo(packageInfoData: PackageInfoDataType) {
        
    }
}
