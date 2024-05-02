//
//  WishlistCollectionViewCell.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "collectionCell"
    
    private let thumbnailImage = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray6
        return label
    }()
    private let priceLabel = UILabel()
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [thumbnailImage, titleLabel, authorLabel, priceLabel])
        stack.spacing = 0
        stack.distribution = .fill
        return stack
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    
    }
}
