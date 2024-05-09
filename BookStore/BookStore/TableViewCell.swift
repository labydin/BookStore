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
    let authorsLabel = UILabel()
    let priceLabel = UILabel()
    let stackView = UIStackView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        stackView.layer.borderWidth = 2
        stackView.layer.cornerRadius = 15
        
        titleLabel.text = "읽기 쉬운 코드"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        authorsLabel.text = "마크 시먼"
        authorsLabel.textColor = .systemGray
        authorsLabel.font = .systemFont(ofSize: 15)
        
        priceLabel.text = "30,000 원"
        priceLabel.font = .systemFont(ofSize: 17)
    }
    
    func setupConstraints() {
        [titleLabel, authorsLabel, priceLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        contentView.addSubview(stackView)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalTo(authorsLabel.snp.leading).offset(5)
        }
        
        authorsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.greaterThanOrEqualTo(priceLabel.snp.leading).offset(10)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }
    
}


