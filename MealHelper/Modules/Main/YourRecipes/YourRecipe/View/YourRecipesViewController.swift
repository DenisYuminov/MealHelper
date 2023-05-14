//
//  YourRecipesViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

final class YourRecipesViewController: UIViewController {
    private let output: YourRecipesViewOutput
    
    // UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: Init
    init(output: YourRecipesViewOutput) {
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
        title = L10n.YourRecipes.Navigation.title
        setup()
    }
    
    // MARK: Private
    
    private func setup() {
        let addButton = UIBarButtonItem(
            image: UIImage.plus,
            landscapeImagePhone: nil,
            style: .plain,
            target: self,
            action: #selector(addButtonTapped)
        )
        navigationItem.rightBarButtonItem = addButton

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    // MARK: Actions

    @objc private func addButtonTapped() {
        output.onCreateRecipeButtonClicked()
    }
}

// MARK: YourRecipesViewInput

extension YourRecipesViewController: YourRecipesViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension YourRecipesViewController: UITableViewDelegate, UITableViewDataSource {
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
        let recipe = output.dataSource[indexPath.row]
        output.didSelectRecipe(recipe: recipe)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .normal,
            title: L10n.YourRecipes.TableViewAction.title
        ) { [weak self] (_, _, completion) in
            self?.output.dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
