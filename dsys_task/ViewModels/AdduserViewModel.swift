//
//  AdduserViewModel.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation


class AddUserViewModel:ObservableObject{
    
    
    private var apiService:APIService?

    @Published var userData: UserData!

    
    init() {
    self.apiService = APIService()
    }



    func addUserData(name:String,email:String,gender:String) {
        
        self.apiService?.apiPostData(name: name, email: email, gender: gender, successHandler: {[weak self] (usersData) in
            self?.userData = usersData
            
        })

        }

}
