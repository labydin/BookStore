//
//  WishlistViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit
import SnapKit
import CoreData

class WishlistViewController: UIViewController {
    
    lazy var deleteButton = UIBarButtonItem()
    lazy var addButton = UIBarButtonItem()
    private let tableView = UITableView()
    
    var persistentContainer: NSPersistentContainer? {
            (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
        }
    var wishList: [WishList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setNavigationBar()
        setTableView()
        setupConstraints()
    }
    
    // MARK: - UI 세팅
    func setNavigationBar() {
        let appearance = UINavigationBarAppearance()

        title = "담은 책"
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        deleteButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(deleteButtonTapped))
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.leftBarButtonItem = self.deleteButton
        self.navigationItem.rightBarButtonItem = self.addButton
    }
    
    func setTableView() {
        print(#function)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        tableView.rowHeight = 100
    }

    func setupConstraints() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
    
    @objc func deleteButtonTapped() {
        // 배열 삭제
        wishList.removeAll()
        tableView.reloadData()
        // 코어데이터 삭제
    }
    
    @objc func addButtonTapped() {

    }

}


extension WishlistViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3//wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
            else { return UITableViewCell() }
        
//        let index = wishList[indexPath.row]
//        cell.titleLabel.text = index.title ?? ""
//        cell.authorsLabel.text = index.authors ?? ""
//        cell.priceLabel.text = "\(index.price)" + " 원"
        
        return cell
    }
    
    
}



