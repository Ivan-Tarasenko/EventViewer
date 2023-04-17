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
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(indexCell)
//        print(viewModel.paraneters(index: indexCell)!)
        
      
        switch section {
        case 1: return 1
        case 2: return viewModel.paraneters(index: indexCell)!.count
        default:
            return 1
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailEventTableCell.identifier,
            for: indexPath) as? DetailEventTableCell else { fatalError("DetailCell nil") }
        
        cell.backgroundColor = .red
        
        return cell
    }
    
    
}
