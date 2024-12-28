//
//  GuildViewController.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/28.
//

import UIKit

class GuildViewController: UIViewController, UIScrollViewDelegate {
 
    var clickBlock: (() -> Void)?
    let pageControl = UIPageControl()
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = .init(width: UIScreen.main.bounds.width * 3, height: 0)
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        let imgArray = ["guild1", "guild2", "guild3"]
        
        for (i, item) in imgArray.enumerated() {
            let imageView = UIImageView(frame: .init(x: CGFloat(i) * UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            imageView.image = UIImage(named: item)
            imageView.isUserInteractionEnabled = true
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            if i == imgArray.count - 1 {
                self.setupStartBtn(img: imageView)
            }
        }
        
        let skipBt = UIButton()
        skipBt.translatesAutoresizingMaskIntoConstraints = false
        skipBt.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.5)
        skipBt.setTitle("跳过", for: .normal)
        skipBt.titleLabel?.font = .systemFont(ofSize: 14)
        skipBt.setTitleColor(.white, for: .normal)
        skipBt.layer.cornerRadius = 6
        skipBt.clipsToBounds = true
        skipBt.addTarget(self, action: #selector(createSkipBt), for: .touchUpInside)
        view.addSubview(skipBt)
        skipBt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        skipBt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        skipBt.heightAnchor.constraint(equalToConstant: 32).isActive = true
        skipBt.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupStartBtn(img: UIImageView) {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        img.addSubview(btn)
        btn.addTarget(self, action: #selector(createSkipBt), for: .touchUpInside)
        btn.leadingAnchor.constraint(equalTo: img.leadingAnchor, constant: 20).isActive = true
        btn.trailingAnchor.constraint(equalTo: img.trailingAnchor, constant: -20).isActive = true
        btn.bottomAnchor.constraint(equalTo: img.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func createSkipBt() {
        self.clickBlock?()
    }
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let _ = scrollView.contentOffset.x / scrollView.frame.width
    }
}
