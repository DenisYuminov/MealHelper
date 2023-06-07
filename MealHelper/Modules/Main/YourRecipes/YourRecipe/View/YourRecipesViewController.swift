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
        view.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        tableView.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        view.addSubview(tableView)
        title = L10n.YourRecipes.Navigation.title
        output.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewDidLoad()
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
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // MARK: Actions
    
    @objc private func refreshData() {
        output.viewDidLoad()
        tableView.refreshControl?.endRefreshing()
    }
    
    @objc private func addButtonTapped() {
        output.onCreateRecipeButtonClicked()
    }
}

// MARK: YourRecipesViewInput

extension YourRecipesViewController: YourRecipesViewInput {
    func reloadData() {
        tableView.reloadData()
    }
    
    func showAlert(for indexPath: IndexPath, completion: @escaping () -> Void) {
        let alertController = UIAlertController(
            title: L10n.YourRecipes.Delete.Alert.title,
            message: L10n.YourRecipes.Delete.Alert.message,
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: L10n.CreateRecipe.CancelButton.title, style: .cancel)
        alertController.addAction(cancelAction)
        
        let deleteConfirmAction = UIAlertAction(
            title: L10n.YourRecipes.TableViewAction.title,
            style: .destructive
        ) { _ in
            completion()
        }
        alertController.addAction(deleteConfirmAction)
        
        present(alertController, animated: true, completion: nil)
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
        output.didSelectRecipe(recipe: recipe.id)
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
            self?.showAlert(for: indexPath) {
                self?.output.deleteRecipe(recipeId: self?.output.dataSource[indexPath.row].id ?? 0)
                self?.output.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            completion(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
