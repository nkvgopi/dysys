//
//  UsersTableViewDataSource.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation
import UIKit


class UsersTableViewDataSource<CELL : UITableViewCell,T>: NSObject, UITableViewDataSource {
    
    
    
    private var users : [T]!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCells
        let user = self.users[indexPath.row]

        return cell
    
    }

}
