//
//  ViewController.swift
//  UiITableTest
//
//  Created by Eugene Krapivenko on 16.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellID = "testCell"
    private var data: [Goods] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomGoodsCell", bundle: nil), forCellReuseIdentifier: cellID)
        
        updateData()
    }
}

extension ViewController {
    
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

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CustomGoodsCell

//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
//        }
        
        cell.goodName.text = data[indexPath.row].name
        cell.goodPrice.text = String(data[indexPath.row].price)
        
        return cell
    }
    
}

