//
//  ProfileScreenExtension.swift
//  CowrywiseClone
//
//  Created by Tim on 02/10/2020.
//

import UIKit

extension ProfileScreenController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileInfoCell
        let currentLastItem = tableViewData[indexPath.row]
        cell.tableviewData = currentLastItem
        return cell
    }
}
