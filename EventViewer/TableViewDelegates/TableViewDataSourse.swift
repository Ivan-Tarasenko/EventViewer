//
//  TableViewDataSourse.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 09.04.2023.
//

import UIKit

final class TableViewDataSourse: NSObject, UITableViewDataSource {
    
    var test = EventManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.allEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let event = test.allEvent[indexPath.row].objectID
        
        cell.textLabel?.text = event.description
        
        return cell
    }
    
    
}
