//
//  DistintCollectCell.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/7.
//

import UIKit

class DistintCollectListCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "distint-collect-cell"
    
    let imageView: UIImageView = .init()
    let titleLab: UILabel = .init()
    let subTitleLab: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        subTitleLab.translatesAutoresizingMaskIntoConstraints = false
        subTitleLab.textAlignment = .right
        contentView.addSubview(subTitleLab)
        NSLayoutConstraint.activate([
            subTitleLab.widthAnchor.constraint(equalToConstant: 50),
            subTitleLab.heightAnchor.constraint(equalToConstant: 30),
            subTitleLab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subTitleLab.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLab)
        NSLayoutConstraint.activate([
            titleLab.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            titleLab.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLab.trailingAnchor.constraint(equalTo: subTitleLab.leadingAnchor, constant: 10),
            titleLab.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
