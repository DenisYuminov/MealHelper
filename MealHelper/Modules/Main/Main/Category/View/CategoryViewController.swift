//
//  CategoryViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import UIKit

final class CategoryViewController: UIViewController {
    // Dependencies
    private let output: CategoryViewOutput
    
    // Properties
    private var category: Section

    // UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: Init
    
    init(output: CategoryViewOutput, category: Section) {
        self.output = output
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        output.viewDidLoad()
    }
    
    // MARK: Private
    
    private func setup() {
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        self.title = category.title
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

// MARK: UITableViewDelegate

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: UITableViewDataSource

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecipeTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? RecipeTableViewCell else {
            fatalError("Failed to dequeue RecipeTableViewCell.")
        }
        
        let recipe = output.dataSource[indexPath.row]
        cell.configure(with: recipe)
        return cell
    }
}

// MARK: CategoryViewInput

extension CategoryViewController: CategoryViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}
