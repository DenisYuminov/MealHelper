//
//  LikesViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

final class LikesViewController: UIViewController {
    // Dependencies
    private let output: LikesViewOutput
    
    // UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: Init

    init(output: LikesViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = L10n.Likes.Navigation.title
        setup()
        output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    // MARK: Private
    
    private func setup() {
        view.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        tableView.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshData() {
        output.viewDidLoad()
        tableView.refreshControl?.endRefreshing()
    }
}

// MARK: LikesViewInput

extension LikesViewController: LikesViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension LikesViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = output.dataSource[indexPath.row].id
        output.didSelectRecipe(recipe: recipe)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
