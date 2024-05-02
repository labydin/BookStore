//
//  DetailViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "detailVC"

    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let thumbnailImage = UIImageView()
    private let priceLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let infoStackView = UIStackView()
    
    private let closeButton = UIButton()
    private let saveButton = UIButton()
    private let buttonStackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureUI()
        setupConstraints()
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - UI 세팅

    
    func setupConstraints() {
        [titleLabel, authorLabel, thumbnailImage, priceLabel, descriptionLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        [closeButton, saveButton].forEach { buttonStackView.addArrangedSubview($0) }
        [infoStackView, buttonStackView].forEach { view.addSubview($0) }
        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        authorLabel.translatesAutoresizingMaskIntoConstraints = false
//        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: infoStackView.centerXAnchor),
//            authorLabel.centerXAnchor.constraint(equalTo: infoStackView.centerXAnchor),
//            thumbnailImage.centerXAnchor.constraint(equalTo: infoStackView.centerXAnchor),
//            priceLabel.centerXAnchor.constraint(equalTo: infoStackView.centerXAnchor),
            
            infoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            infoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            infoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            infoStackView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -30),
            
            closeButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor, multiplier: 0.35),
            closeButton.heightAnchor.constraint(equalToConstant: 50),

            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    // MARK: - 버튼 기능 구현
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
