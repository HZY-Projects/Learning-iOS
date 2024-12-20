//
//  VideosController.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/12.
//

import UIKit
import SJVideoPlayer

class VideosController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    var dataArray: [VideosData] = []
    var collectionView: UICollectionView! = nil
    var player: SJVideoPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Conference Videos"
        configureHierarchy()
        configureDataSource()
    }
    
    deinit {
        debugPrint("VideosController deinit")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player?.vc_viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.vc_viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player?.vc_viewDidDisappear()
    }
}

extension VideosController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
}

extension VideosController {
    func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        VideosCell.register(with: collectionView)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    func configureDataSource() {
        dataArray =  [
            VideosData(title: "The New iPad Pro",
                       category: "Tech Talks",
                       url: "https://dh2.v.netease.com/2017/cg/fxtpty.mp4?idx=1"),
            VideosData(title: "Building Apps for iPhone XS, iPhone XS Max, and iPhone XR",
                       category: "Tech Talks",
                       url: "https://dh2.v.netease.com/2017/cg/fxtpty.mp4"),
            VideosData(title: "App Store Connect",
                       category: "App Store Connect",
                       url: "https://dh2.v.netease.com/2017/cg/fxtpty.mp4"),
            VideosData(title: "Apps on Your Wrist",
                       category: "Conference 2018",
                       url: "https://dh2.v.netease.com/2017/cg/fxtpty.mp4"),
            VideosData(title: "Speaking with Siri",
                       category: "Conference 2018",
                       url: "http://vfx.mtime.cn/Video/2019/06/29/mp4/190629004821240734.mp4")
        ]
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        VideosCell.init(collectionView: collectionView, indexPath: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.bounds.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        let video = dataArray[indexPath.row].url
        
        var url: URLComponents = URLComponents.init(url: URL(string: video)!, resolvingAgainstBaseURL: false)!
        url.query = "idx=1"
        
        if ((player == nil)) {
            player = SJVideoPlayer()
        }
        
        let model = SJPlayModel.init(collectionView: self.collectionView, indexPath: indexPath, superviewSelector: NSSelectorFromString("coverImageView"))
        
        player?.urlAsset = SJVideoPlayerURLAsset.init(url: URL(string: video)!, playModel: model)
        
        player?.urlAsset?.title = "title title title"
        
        player?.resumePlaybackWhenScrollAppeared = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? VideosCell else { return }
        
        let video = dataArray[indexPath.row]

        cell.titleLabel.text = video.title
        cell.categoryLabel.text = video.category
    }
}
