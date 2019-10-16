//
//  Missing_item.swift
//  mfgodat
//
//  Created by Mobark on 15/10/2019.
//  Copyright © 2019 ff8aaf. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialButtons_Theming
class Missing_item: UITableViewCell {
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var item_details: UILabel!
    @IBOutlet weak var item_state: MDCRaisedButton!
    @IBOutlet weak var real_date: UILabel!
    @IBOutlet weak var item_place: UILabel!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var username: UILabel!
    let containerScheme = MDCContainerScheme()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func initData(data : [String: Any]) {
        containerScheme.colorScheme.primaryColor = .blue
        myView.layer.cornerRadius = 4.0
        myView.layer.shadowColor = UIColor.gray.cgColor
        myView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myView.layer.shadowRadius = 3.0
        myView.layer.shadowOpacity = 0.5
        item_details.text = data["item_details"] as? String
        item_name.text = data["item_name"] as? String
        username.text = data["user_name"] as? String
        real_date.text = data["real_date"] as? String
        item_place.text = data["item_place"] as? String
        let state = data["item_state"] as? String
        item_state.setElevation(ShadowElevation(rawValue: 1.5), for: .normal)
        item_state.setElevation(ShadowElevation(rawValue: 3), for: .highlighted)
        item_state.applyOutlinedTheme(withScheme: containerScheme)
        item_state.setTitle(state, for: UIControlState.normal)
        item_state.sizeToFit()
        if (state == "عثر عليه"){
            item_state.setImage(UIImage(named: "icons8-smiling.png"), for: UIControlState.normal)
        } else {
            item_state.setImage(UIImage(named: "icons8-disappointed.png"), for: UIControlState.normal)

        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
