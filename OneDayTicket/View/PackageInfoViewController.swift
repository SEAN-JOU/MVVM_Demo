
//
//  Created by hangge on 16/1/19.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class PackageInfoViewController: UIViewController {
    
    @IBOutlet weak var qrcodeBtn: UIButton!
    
    private let dotImage = UIImage(named: "ic_action_graydot")
    private let dotSelectImage = UIImage(named: "ic_action_whitedot")
    
    @IBOutlet weak var titleScrollView: UIView!
    private lazy var autoScrollView1: LTAutoScrollView = {
        let autoScrollView = LTAutoScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        autoScrollView.glt_timeInterval = 5
        autoScrollView.autoViewHandle = {
            return self.customAutoView1()
        }
        autoScrollView.isAutoScroll = true
        autoScrollView.didSelectItemHandle = {[weak self] in
            print("autoScrollView2 点击了第 \($0) 个索引")
        }
        autoScrollView.pageControlDidSelectIndexHandle = { index in
            print("autoScrollView2 pageControl点击了第 \(index) 个索引")
        }
        let layout = LTDotLayout(dotImage: dotImage, dotSelectImage: dotSelectImage)
        layout.dotMargin = 10.0
        autoScrollView.dotLayout = layout
        return autoScrollView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleScrollView.backgroundColor = UIColor.white
        titleScrollView.addSubview(autoScrollView1)
        qrcodeBtn.setOnClickListener {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ScannerViewController") as! ScannerViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    private func customAutoView1() -> [UIImageView] {
        var views = [UIImageView]()
        for index in 0 ..< 3 {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 350))
            imageView.backgroundColor = UIColor.white
            views.append(imageView)
            
            let label1 = UILabel(frame: CGRect(x: 40, y: 40, width: 180, height: 25))
            label1.textColor = UIColor.white
            label1.textAlignment = .center
            label1.backgroundColor = UIColor.gray
            label1.text = "123"
            imageView.addSubview(label1)
            
            let label2 = UILabel(frame: CGRect(x: 0, y: 125, width: view.bounds.width, height: 25))
            label2.textColor = UIColor.white
            label2.backgroundColor = UIColor.gray
            label2.text = "345"
            imageView.addSubview(label2)
        }
        return views
    }
    
  
}
