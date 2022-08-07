//
//  UserModel.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation


struct UserData: Decodable {
    let id: Int?
    let name, email: String?
    let gender: String?
    let status: String?
}



typealias UsersModel = [UserData]


struct ErrorData:Decodable{
    let field:String
    let message:String
}
