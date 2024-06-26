//
//  DetailViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    static let identifier = "DetailVC"

    private let titleLabel = UILabel()
    private let authorsLabel = UILabel()
    private let thumbnailImage = UIImageView()
    private let priceLabel = UILabel()
    private let contentsLabel = UILabel()
    private let infoStackView = UIStackView()
    
    private let closeButton = UIButton()
    private let saveButton = UIButton()
    private let buttonStackView = UIStackView()

    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    
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
        
        authorsLabel.font = .systemFont(ofSize: 17)
        authorsLabel.textColor = .systemGray
        authorsLabel.textAlignment = .center
        authorsLabel.text = "테스트지롱"
        
        priceLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        priceLabel.textAlignment = .center
        priceLabel.text = "책값 너무 비쌈"
        
        contentsLabel.text = "이 책은 영국에서 시작되어 어쩌구 저쩌구"
        
        infoStackView.axis = .vertical
        infoStackView.spacing = 10
        
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
        [titleLabel, authorsLabel, thumbnailImage, priceLabel, contentsLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        [closeButton, saveButton].forEach { buttonStackView.addArrangedSubview($0) }
        [infoStackView, buttonStackView].forEach { view.addSubview($0) }
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorsLabel.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thumbnailImage.heightAnchor.constraint(equalTo: thumbnailImage.widthAnchor, multiplier: 0.5),
            contentsLabel.heightAnchor.constraint(equalTo: thumbnailImage.heightAnchor),
            
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
    
    @objc func saveButtonTapped() {
//        //guard let context = self.persistentContainer?.viewContext, let bookResult = self.bookResult else { return }
//
//        let wishlist = WishList(context: context)
//        
//        wishlist.authors = authorsLabel.text
//        wishlist.title = titleLabel.text
//        wishlist.price = Int32(priceLabel.text)
//        
//        try? context.save()
    }
}
