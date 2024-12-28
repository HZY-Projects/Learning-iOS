//
//  DistintCollectGridCell.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/7.
//

import UIKit

class DistintCollectHoriCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "distint-collect-hori-cell"
    
    let imageView: UIImageView = .init()
    let titleLab: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        titleLab.font = .preferredFont(forTextStyle: .title3)
        contentView.addSubview(titleLab)
        NSLayoutConstraint.activate([
            titleLab.heightAnchor.constraint(equalToConstant: 25),
            titleLab.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            titleLab.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: titleLab.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
