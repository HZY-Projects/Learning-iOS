//
//  GridCollectionCell.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/3.
//

import UIKit

class GridCollectionCell: UICollectionViewCell {
    
    let image: UIImageView = .init()
    let titleLab: UILabel = .init()
    let desLab = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    func configUI() {
        contentView.addSubview(image)
        contentView.addSubview(titleLab)
        contentView.addSubview(desLab)
        
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        desLab.translatesAutoresizingMaskIntoConstraints = false
        
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 2/3).isActive = true
        
        titleLab.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        titleLab.leadingAnchor.constraint(equalTo: image.leadingAnchor).isActive = true
        titleLab.trailingAnchor.constraint(equalTo: image.trailingAnchor).isActive = true
        titleLab.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLab.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLab.numberOfLines = 1
        
        desLab.topAnchor.constraint(equalTo: titleLab.bottomAnchor, constant: 3).isActive = true
        desLab.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        desLab.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        desLab.heightAnchor.constraint(equalToConstant: 17).isActive = true
        desLab.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
