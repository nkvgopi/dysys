//
//  UserViewModel.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation
import Combine



class UserViewModel: ObservableObject{
    
    private var apiService:APIService?

    @Published var usersData: [UserData] = []

    
    init() {
    self.apiService = APIService()
    }



    func callToGetuserData() {
            self.apiService?.apiToGetUserData(successHandler: { [weak self] (usersData) in
                self?.usersData = usersData
            })
        }
    
}
