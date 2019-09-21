//
//  ViewController.swift
//  NestedTableView
//
//  Created by Aung Ko Ko on 9/15/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableViewParentList: UITableView!
    
    var parentList:[ParentVO] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewParentList.delegate = self
        tableViewParentList.dataSource = self
        tableViewParentList.separatorStyle = .none
        tableViewParentList.register(UINib(nibName: ParentListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ParentListItemTableViewCell.identifier)
        ParentModel.shared().apiGetHouseRentingList(success: {
            self.tableViewParentList.reloadData()
        }) { (err) in
            print(err)
        }
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return self.parentList.count
        return ParentModel.shared().parentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParentListItemTableViewCell.identifier, for: indexPath) as! ParentListItemTableViewCell
        cell.parent = ParentModel.shared().parentList[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let childItemCount = ParentModel.shared().parentList[indexPath.row].childs?.count ?? 0
         return   CGFloat(52 + (108 * childItemCount))
    }
}
