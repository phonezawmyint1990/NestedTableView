//
//  ParentModel.swift
//  NestedTableView
//
//  Created by Aung Ko Ko on 9/21/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Alamofire
class ParentModel {
    class func shared() -> ParentModel {
        return sharedParentModel
    }
    
    private static var sharedParentModel: ParentModel = {
        let houseModel = ParentModel()
        return houseModel
    }()
    
   
    var parentList:[ParentVO] = []
    func apiGetHouseRentingList(success:@escaping()-> Void, failure:@escaping(String) -> Void){
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else {return}
            do {
                // let decoder = JSONDecoder()
                // decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.parentList = try JSONDecoder().decode([ParentVO].self, from: data)
                success()
            }catch let jsonerr {
                failure(jsonerr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    
    
    
}
