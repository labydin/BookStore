//
//  ViewController.swift
//  BookStore
//
//  Created by 박준영 on 5/1/24.
//

import UIKit

class ViewController: UIViewController {

    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.layer.cornerRadius = 10
        bar.placeholder = "찾으시는 도서를 입력하세요."
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let searchResultLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과"
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    let tabBar: UITabBar = {
        let tabbar = UITabBar()
        tabbar.barStyle = .default
        tabbar.translatesAutoresizingMaskIntoConstraints = false
        return tabbar
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setSearchBar()
        setConstraints()
    }
    
    func setSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        
    }
    
    
    func setConstraints() {
        [searchBar, searchResultLabel, collectionView, tabBar].forEach {
            view.addSubview($0)
        }
       
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            searchResultLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            searchResultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchResultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchResultLabel.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

}

