//
//  EventListViewModel.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 11.04.2023.
//

import Foundation
import CoreData

protocol EventListModelProtorol: AnyObject {
    
    var allEvents: [NSManagedObject] { get set }
    
    func eventID(index: Int) -> String?
    func eventDate(index: Int) -> String?
    func reloadData(completion: @escaping () -> Void)
    func deleteEvent(index: Int)
    func search(searchText: String)
}

final class EventListViewModel: EventListModelProtorol {
    
    
    let eventManager: EventManager?
    
    var allEvents: [NSManagedObject] = []
    
    init(eventManager: EventManager) {
        self.eventManager = eventManager
    }
    
    func eventID(index: Int) -> String? {
        guard !allEvents.isEmpty else { return "No Events" }
        return allEvents[index].value(forKey: KeyProperties.id) as? String
    }
    
    func eventDate(index: Int) -> String? {
        guard !allEvents.isEmpty else { return "No Date" }
        guard let eventDate = allEvents[index].value(forKey: KeyProperties.createAt) as? Date else { return "Not Date" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let timeString = dateFormatter.string(from: eventDate)
        return timeString
    }
    
    func reloadData(completion: @escaping () -> Void) {
        guard let eventManager = eventManager else { return }
        eventManager.getEvents()
        allEvents = eventManager.events
        completion()
    }
    
    func deleteEvent(index: Int) {
        guard !allEvents.isEmpty else { return }
        guard let eventManager = eventManager else { return }
        eventManager.deleteEvent(index: index)
        allEvents.remove(at: index)
    }
    
    func search(searchText: String) {
        
        for (index, event) in allEvents.enumerated() where
        event.value(forKey: KeyProperties.id) as? String ~= searchText {
            
            let removeItem = allEvents.remove(at: index)
            allEvents.insert(removeItem, at: 0)
        }
    }
}
