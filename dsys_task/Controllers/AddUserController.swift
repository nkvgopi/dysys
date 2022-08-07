//
//  AddUserController.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation
import UIKit
import Combine



class AddUserController: UIViewController{
    
    @IBOutlet weak var nameLable:UITextField!
    @IBOutlet weak var emailLable:UITextField!
    @IBOutlet weak var genderSegment:UISegmentedControl!

    
    var genderString = "Male"
    
    var viewModel = AddUserViewModel()
    private var cancellables: Set<AnyCancellable> = []

    var backHelper:BackHelper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch genderSegment.selectedSegmentIndex {
        case 0:
            genderString = "Male"
            
        case 1:
            genderString = "Female"

        default:
            genderString = "Other"

            break;
        }
    }

    
    
    @IBAction func addClick(_ sender: Any) {
        
        let emailStr:String = emailLable.text ?? ""
        let nameStr = nameLable.text ?? ""
        
        if emailStr.isEmpty {
            
        }else if emailStr.isEmpty {
            
        }else{
            
            viewModel.addUserData(name: nameStr, email: emailStr, gender: genderString)
            viewModel.$userData.receive(on: DispatchQueue.main)
               .sink { [weak self] userData in
                   self?.performOperation()
               }
               .store(in: &cancellables)
        
        }
    }
    
    func performOperation(){
        
        navigationController?.popViewController(animated: true)
        backHelper.onBackPressed()
    }
    
}
