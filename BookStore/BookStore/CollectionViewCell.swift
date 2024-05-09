//
//  WishlistCollectionViewCell.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionCell"
    
    var thumbnailImage = UIImageView()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "여행의 이유"
        return label
    }()
    var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray4
        label.textAlignment = .center
        label.text = "김영하"
        return label
    }()
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "비싸용"
        return label
    }()
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [thumbnailImage, titleLabel, authorLabel, priceLabel])
        stack.spacing = 0
        stack.distribution = .fill
        stack.axis = .vertical
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
