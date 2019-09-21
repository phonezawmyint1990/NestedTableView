
//  NestedTableView
//
//  Created by Aung Ko Ko on 9/15/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit

class ParentListItemTableViewCell: UITableViewCell {
 static let identifier = "ParentListItemTableViewCell"
    
    @IBOutlet weak var lblParentName: UILabel!
    @IBOutlet weak var tableViewChildList: UITableView!
    
    var parent: ParentVO?{
        didSet{
            if let parent = parent {
                lblParentName.text = parent.parentName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        tableViewChildList.delegate = self
        tableViewChildList.dataSource = self
        tableViewChildList.separatorStyle = .none
        tableViewChildList.register(UINib(nibName: ChildListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ChildListItemTableViewCell.identifier)
        tableViewChildList.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ParentListItemTableViewCell :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parent?.childs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildListItemTableViewCell.identifier, for: indexPath) as! ChildListItemTableViewCell
        cell.child = parent?.childs?[indexPath.row]
        return cell
    }
    
    
}

extension ParentListItemTableViewCell: UITableViewDelegate{
    
}
