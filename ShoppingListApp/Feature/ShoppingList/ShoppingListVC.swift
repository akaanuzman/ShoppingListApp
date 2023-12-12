//
//  ShoppingListVC.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 30/11/23.
//

import UIKit

final class ShoppingListVC: UIViewController {
    private let shoppingList = ["Egg", "Fish", "Meat", "Apple", "Orange", "Chicken", "Coco Cola", "A", "B", "C", "D", "E"]

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .systemGreen
        return searchController
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            ShoppingListCell.self,
            forCellReuseIdentifier: TableViewIdentifiers.shoppingList.rawValue
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupUI() {
        navigationItem.searchController = searchController
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ShoppingListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.shoppingList.rawValue) as! ShoppingListCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

#Preview {
    ShoppingListVC()
}
