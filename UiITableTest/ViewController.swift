//
//  ViewController.swift
//  UiITableTest
//
//  Created by Eugene Krapivenko on 16.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellID = "productCell"
    private var data: [Goods] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        setupNavigationBar()
        updateData()
    }
}

extension ViewController {
    
    func setupTable () {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    func updateData() {
        SomeShop().getList({ [weak self] result, error in
            if error == nil {
                self?.data.append(contentsOf: result)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        })
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ProductCell
        
        cell.nameLabel.text = data[indexPath.row].name
        cell.discriptionLabel.text = data[indexPath.row].discription
        cell.priceLabel.text = String(data[indexPath.row].price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let chosenSwipe = UIContextualAction(style: .normal, title: "Избранное") { action, view, success in
            print("Избранное")
        }
        chosenSwipe.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [chosenSwipe])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let baySwipe = UIContextualAction(style: .normal, title: "Купить") { action, view, success in
            print("Купить")
        }
        
        baySwipe.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        let moreSwipe = UIContextualAction(style: .normal, title: "Еще") { action, view, success in
            print("Еще")
        }
        moreSwipe.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [moreSwipe, baySwipe])
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
    }
    
    
}
