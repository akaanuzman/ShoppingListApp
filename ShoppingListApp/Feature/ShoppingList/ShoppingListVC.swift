//
//  ShoppingListVC.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 30/11/23.
//

import UIKit

final class ShoppingListVC: UIViewController {
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .systemGreen
        return searchController
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)

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
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: SFSymbols.filter,
            style: .done,
            target: self,
            action: #selector(filterButtonTapped)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .systemGreen
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
    }

    private func setupUI() {
        navigationItem.searchController = searchController
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc private func filterButtonTapped() {}

    @objc private func addButtonTapped() {
        navigationController?.pushViewController(AddItemVC(), animated: true)
    }
}

extension ShoppingListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingListModel.dummyList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.shoppingList.rawValue) as! ShoppingListCell
        let shoppingItem = ShoppingListModel.dummyList[indexPath.row]
        cell.configureCell(with: shoppingItem)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

#Preview {
    ShoppingListVC()
}
