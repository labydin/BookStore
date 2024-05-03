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
    
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let priceLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        titleLabel.text = "읽기 쉬운 코드"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        authorLabel.text = "마크 시먼"
        authorLabel.textColor = .systemGray
        authorLabel.font = .systemFont(ofSize: 15)
        
        priceLabel.text = "30,000원"
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
