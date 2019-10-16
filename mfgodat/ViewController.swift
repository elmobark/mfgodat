//
//  ViewController.swift
//  mfgodat
//
//  Created by Mobark on 15/10/2019.
//  Copyright © 2019 ff8aaf. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialSnackbar
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    //// init Outlets
    @IBOutlet weak var missings_items_table: UITableView!
    /// End init
    /// Dictionary Temp Holder
    var missing_items = [Dictionary<String,Any>]()
    /// End holding
    /// init Delegate and DataSource for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /// return number of cells in missings_table
        return missing_items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.missing_items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "missings_items_cell") as! Missing_item
        cell.initData(data: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 238
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Connectivity().loadFromServer(url: Missings_url) { (datas) in
            self.missing_items = datas
            self.missings_items_table.reloadData()
            let message = MDCSnackbarMessage()
            message.text = "تم تحميل البيانات بنجاح"
            MDCSnackbarManager.show(message)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

