//
//  TableViewDataSourse.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 09.04.2023.
//

import UIKit

final class TableViewDataSourse: NSObject, UITableViewDataSource {
    
    var events: EventListProtorol = EventListViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if events.allEvents.isEmpty {
            return 1
//        } else {
//            return events.allEvents.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { fatalError("Cell nil") }
        
//        let eventID = events.allEvents[indexPath.row].value(forKey: "id") as? String ?? "Not Events"
//        let eventDate = events.allEvents[indexPath.row].value(forKey: "createdAt") as? Date ?? nil
        
        cell.titleLabel.text = events.eventID(index: indexPath.row)
        cell.subtitleLabel.text = events.eventDate(index: indexPath.row)
        
        return cell
    }
    
    
}
