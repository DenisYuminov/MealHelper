//
//  LikesViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

class LikesViewController: UIViewController {
    // Dependencies
    private let output: LikesViewOutput
    private var recipes: [RecipeModel] = []
    
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
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        title = L10n.Likes.Navigation.title
        setup()
        output.viewDidLoad()
    }
    
    // Private
    private func setup() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

extension LikesViewController: LikesViewInput {
    func getRecipes(_ recipes: [RecipeModel]) {
        self.recipes = recipes
        tableView.reloadData()
    }
}

extension LikesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecipeTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? RecipeTableViewCell else {
            fatalError("Failed to dequeue RecipeTableViewCell.")
        }
        let recipe = recipes[indexPath.row]
        cell.configureCell(with: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        output.didSelectRecipe(recipe: recipe)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
