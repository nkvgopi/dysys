//
//  APIService.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation



class APIService: NSObject{
    
    private let AuthTokenString = "bf5ae0545662a855b30d44526935fef6a01cb500aa66a9250206648bd41330a9"
    
    private let sourcesURL = URL(string: "https://gorest.co.in/public/v2/users")!
    
    func apiToGetUserData(successHandler : @escaping (UsersModel) -> ()){
      
        var request = URLRequest(url: sourcesURL)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")

        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                let userData = try! jsonDecoder.decode(UsersModel.self, from: data)
                DispatchQueue.main.async {
                                   successHandler(userData)
                               }
            }
        }.resume()
    }
    
    
    func apiPostData(name:String,email:String,gender:String,successHandler : @escaping (UserData) -> ()){
        
        let parameters = ["name" : "\(name)", "email" : "\(email)","gender" : "\(gender)","status" : "active"]
        var request = URLRequest(url: sourcesURL)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer " + AuthTokenString, forHTTPHeaderField: "Authorization")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
          } catch let error {
            print(error.localizedDescription)
            return
          }
    
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                do {
                    let userData = try jsonDecoder.decode(UserData.self, from: data)
                    DispatchQueue.main.async {
                    successHandler(userData)
                    }
                }catch let error {
                    print(error.localizedDescription)

                }
            }
        }.resume()

        
    
    }

}
