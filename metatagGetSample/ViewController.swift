//
//  ViewController.swift
//  metatagGetSample
//
//  Created by 水野祥子 on 2019/07/06.
//  Copyright © 2019 sachiko. All rights reserved.
//

import UIKit

var items:[Item] = []
class ViewController: UIViewController {
    
    var refreshItem:UIBarButtonItem!
    var searchItem:UIBarButtonItem!
    let table:UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshItem = UIBarButtonItem(title: "更新", style: .done
            , target: self, action: #selector(ViewController.refresh))
        self.searchItem = UIBarButtonItem(title: "検索", style: .done
            , target: self, action: #selector(ViewController.search))
        
        self.navigationItem.rightBarButtonItems = [self.searchItem, self.refreshItem]
        
        table.frame = self.view.frame
        table.dataSource = self
        table.delegate = self
        
        self.view.addSubview(table)

        
    }
    
    @objc func search() {
        let wkWebViewController = WebViewController()
        self.navigationController?.pushViewController(wkWebViewController, animated: true)
    }
    
    
    @objc func refresh() {
        self.table.reloadData()
    }

}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].discription
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        let itemDetailsViewController = ItemDetailsViewController(item: items[indexPath.row])
        self.navigationController?.pushViewController(itemDetailsViewController, animated: true)
    }
}

