//
//  ParentVO.swift
//  NestedTableView
//
//  Created by Aung Ko Ko on 9/15/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
struct ParentVO: Codable{
    var id:Int?
    var parentName:String?
    var childs:[ChildVO]?
}
