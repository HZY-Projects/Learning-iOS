//
//  VideosCell.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/12.
//

import UIKit
import SJUIKit
import SJVideoPlayer
import SJBaseVideoPlayer

class VideosCell: SJBaseCollectionViewCell {

    let titleLabel = UILabel()
    let categoryLabel = UILabel()
    let coverImageView: UIImageView = .init()
    let playBtn = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension VideosCell {
    func configure() {
            
        contentView.backgroundColor = .systemGray
        coverImageView.image = .init(named: "iceland.jpg")
        coverImageView.contentMode = .scaleToFill
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImageView)
        coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        
        contentView.addSubview(playBtn)
        playBtn.image = .init(systemName: "arrowtriangle.right.circle.fill")
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.centerXAnchor.constraint(equalTo: coverImageView.centerXAnchor).isActive = true
        playBtn.centerYAnchor.constraint(equalTo: coverImageView.centerYAnchor).isActive = true
        playBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playBtn.heightAnchor.constraint(equalTo: playBtn.widthAnchor).isActive = true
        
        playBtn.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)

        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        categoryLabel.adjustsFontForContentSizeCategory = true

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 3),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
}
