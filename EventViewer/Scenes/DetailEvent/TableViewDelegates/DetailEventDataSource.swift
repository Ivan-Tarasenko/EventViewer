//
//  DetailEventDataSource.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 17.04.2023.
//

import UIKit

final class DetailEventDataSource: NSObject, UITableViewDataSource {
    
    var viewModel: DetailEventModelProtocol!
    var indexCell: Int!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return viewModel.paravetersOfEvent[R.KeyProperties.parameters]?.count ?? 1
        default:
            return 1
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailTableViewCell.identifier,
            for: indexPath) as? DetailTableViewCell else { fatalError("DetailCell nil") }
        
        cell.selectionStyle = .none
        
        
        switch indexPath.section {
        case 0:
            if let eventID = viewModel.paravetersOfEvent[R.KeyProperties.id] {
                cell.titleLabel.text = eventID[indexPath.row]
            }
            
        case 1:
            if let timeEvent = viewModel.paravetersOfEvent[R.KeyProperties.createAt] {
                cell.titleLabel.text = timeEvent[indexPath.row]
            }
            
        case 2:
            if let parameters = viewModel.paravetersOfEvent[R.KeyProperties.parameters] {
                cell.resetConstraint()
                if !parameters.isEmpty {
                    cell.titleLabel.text = viewModel.titlesParameter[indexPath.row]
                    cell.textView.text = parameters[indexPath.row]
                }
                
            }  else {
                cell.titleLabel.text = R.ErrorTitle.noParameter
            }
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
