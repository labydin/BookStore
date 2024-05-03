//
//  DetailViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailVC"

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
    func configureUI() {
        titleLabel.font = .boldSystemFont(ofSize: 23)
        titleLabel.textAlignment = .center
        titleLabel.text = "제목 테스트"
        
        authorLabel.font = .systemFont(ofSize: 17)
        authorLabel.textColor = .systemGray
        authorLabel.textAlignment = .center
        authorLabel.text = "테스트지롱"
        
        priceLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        priceLabel.textAlignment = .center
        priceLabel.text = "책값 너무 비쌈"
        
        infoStackView.axis = .vertical
        infoStackView.spacing = 5
        
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .white
        closeButton.backgroundColor = .systemGray
        closeButton.layer.cornerRadius = 20
        
        saveButton.setTitle("담기", for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemGreen
        saveButton.layer.cornerRadius = 20
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
    }
    
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
