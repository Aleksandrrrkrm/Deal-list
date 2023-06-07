//
//  VC+UIView.swift
//  TemplateOfDealsViewer
//
//  Created by Александр Головин on 07.06.2023.
//

import UIKit

extension ViewControllerImp {
    
    func setupAllView() {
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Deals"
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    private func setupTableView() {
        tableView.register(DealCell.self, forCellReuseIdentifier: DealCell.reuseIidentifier)
        tableView.register(HeaderCell.self, forHeaderFooterViewReuseIdentifier: HeaderCell.reuseIidentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
