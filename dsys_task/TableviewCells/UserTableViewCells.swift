//
//  TableviewCells.swift
//  dsys_task
//
//  Created by Gopinath Vaiyapuri on 06/08/22.
//

import Foundation
import UIKit



class UserTableViewCells: UITableViewCell{
    
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var idLable: UILabel!

    
    
    var userData : UserData? {
            didSet {
                nameLable.text = userData?.name
                emailLable.text = userData?.email
                genderLable.text = userData?.gender
                idLable.text = "\(userData?.id ?? 0)"
            }
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()

        }

}
