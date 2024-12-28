//
//  DistintCollectGridCell.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/7.
//

import UIKit

class DistintCollectGridCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "distint-collect-grid-cell"
    
    let imageView: UIImageView = .init()
    let titleLab: UILabel = .init()
    let subTitleLab: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        titleLab.font = .preferredFont(forTextStyle: .headline)
        contentView.addSubview(titleLab)
        NSLayoutConstraint.activate([
            titleLab.heightAnchor.constraint(equalToConstant: 25),
            titleLab.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            titleLab.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        
        subTitleLab.translatesAutoresizingMaskIntoConstraints = false
        subTitleLab.font = .preferredFont(forTextStyle: .body)
        contentView.addSubview(subTitleLab)
        NSLayoutConstraint.activate([
            subTitleLab.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subTitleLab.heightAnchor.constraint(equalToConstant: 20),
            subTitleLab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            subTitleLab.topAnchor.constraint(equalTo: titleLab.bottomAnchor, constant: 5)
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
