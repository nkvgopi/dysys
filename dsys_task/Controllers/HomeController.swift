//
//  ViewController.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import UIKit
import Combine


class HomeController: UIViewController,BackHelper {
    
    
    
    func onBackPressed() {
        self.viewModel.callToGetuserData()
    }
    

    
    @IBOutlet weak var tableView:UITableView!

    var viewModel = UserViewModel()

    private var cancellables: Set<AnyCancellable> = []

    var backHelper:BackHelper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        self.viewModel.callToGetuserData()
        viewModel.$usersData.receive(on: DispatchQueue.main)
           .sink { [weak self] UsersModel in
              self?.tableView.reloadData()
           }
           .store(in: &cancellables)
   
    }
    
    @IBAction func addUser(_ sender: Any) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "AddUserController") as! AddUserController
        next.backHelper = self
        navigationController?.pushViewController(next, animated: true)
    }


}
    
extension HomeController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.usersData.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCells
        cell.userData =  viewModel.usersData[indexPath.row]
        return cell
    
    }

    
}
    



