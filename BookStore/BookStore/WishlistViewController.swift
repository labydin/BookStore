//
//  WishlistViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit
import SnapKit

class WishlistViewController: UIViewController {
    
    private let appearance = UINavigationBarAppearance()
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setTableView()
        setupConstraints()
    }
    
    func setTableView() {
        print(#function)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        tableView.rowHeight = 100
    }
    
    func setNavigationBar() {
        appearance.configureWithOpaqueBackground()

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

}


extension WishlistViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
            else { return UITableViewCell() }
        print("cell 띄워줭")
        cell.layer.borderWidth = 2
        
        return cell
    }
    
    
}



