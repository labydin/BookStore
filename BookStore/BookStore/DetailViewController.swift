//
//  DetailViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit

class DetailViewController: UIViewController {

    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let thumbnailImage = UIImageView()
    private let priceLabel = UILabel()
    private let descriptionLabel = UILabel()
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, authorLabel, thumbnailImage, priceLabel, descriptionLabel])
        stack.spacing = 5
        return stack
    }()
    
    private let closeButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "delete"), for: .normal)
        bt.backgroundColor = .systemGray
        bt.layer.cornerRadius = 10
        return bt
    }()
    private let saveButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("담기", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .systemGreen
        bt.layer.cornerRadius = 10
        return bt
    }()
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [closeButton, saveButton])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
    }
    

    func setupConstraints() {
        [stackView, buttonStackView].forEach {
            view.addSubview($0)
        }
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor, multiplier: 0.25),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }


}
