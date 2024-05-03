//
//  TableViewCell.swift
//  BookStore
//
//  Created by 박준영 on 5/2/24.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableCell"
    
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let priceLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 15
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        authorLabel.textColor = .systemGray
        authorLabel.font = .systemFont(ofSize: 15)
        
        priceLabel.font = .systemFont(ofSize: 17)
    }
    
    func setupConstraints() {
        [titleLabel, authorLabel, priceLabel].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalTo(authorLabel.snp.leading).inset(5)
        }
        
        authorLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            //$0.trailing.equalTo(priceLabel.snp.leading).offset(10)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
}
