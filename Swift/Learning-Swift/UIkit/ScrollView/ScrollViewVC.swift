//
//  ScrollViewVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/18.
//

import UIKit

class ScrollViewVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let imageV = UINib(nibName: "ItemImageView", bundle: nil)
//        let img = imageV.instantiate(withOwner: nil)
//        if let img = img.first as? UIImageView {
//            img.image = UIImage(named: "UIImage_1")
//            scrollView.addSubview(img)
//        }
        
        for i in 1...8 {
            if let imgView = Bundle.main.loadNibNamed("ItemImageView", owner: nil)?.first as? UIImageView {
                imgView.frame = .init(x: 10, y: (i - 1) * 140 + 20, width: Int(scrollView.bounds.width) - 20, height: 120)
                imgView.backgroundColor = .blue
                scrollView.addSubview(imgView)
            }
        }
            
        let maxY = scrollView.subviews.last?.frame.maxY ?? 0
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: maxY + 20)
        
    }
}
