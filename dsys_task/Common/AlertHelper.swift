//
//  AlertHelper.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 07/08/22.
//

import Foundation
import UIKit



extension UIViewController{
    

    func showAlertHelper(){
        let alertController = UIAlertController(title: nil, message: "Please wait\n\n", preferredStyle: .alert)
        let spinnerIndicator = UIActivityIndicatorView(style: .medium)
        spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
        spinnerIndicator.color = UIColor.black
        spinnerIndicator.startAnimating()
        alertController.view.addSubview(spinnerIndicator)
        self.present(alertController, animated: false, completion: nil)

    }
    
    func dismissAlert(){
     //   alertController.dismiss(animated: true)
    }
}
