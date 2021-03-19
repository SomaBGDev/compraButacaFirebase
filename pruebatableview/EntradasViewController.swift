//
//  EntradasViewController.swift
//  pruebatableview
//
//  Created by mulder on 13/02/2020.
//  Copyright © 2020 mulder. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class EntradasViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewEntradas: UITableView!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "butaca",for: indexPath) as! CellButaca
        
        return cell
    }
    
    override func viewDidLoad() {
        tableViewEntradas.rowHeight = 460
        tableViewEntradas.dataSource = self
        tableViewEntradas.delegate = self
      
        tableViewEntradas.contentSize.height = 460
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
  
    
    
    
}
