//
//  AddEventDataSource.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 20.04.2023.
//

import UIKit

final class AddEventDataSource: NSObject, UITableViewDataSource {
    
    var viewModel: AddEventModelProtocol!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 4
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AddEventTableViewCell.identifier,
            for: indexPath) as? AddEventTableViewCell else { fatalError("DetailCell nil") }
        
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = R.CreateEvent.enterID
            
        case 1:
            
            cell.titleLabel.text = R.CreateEvent.enterDate
            
        case 2:
            cell.resetConstraint()
            cell.titleLabel.text = viewModel.titlesEnterParameter[indexPath.row]

        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = viewModel.titlesSection[section]
        return section
    }
    
    
}
