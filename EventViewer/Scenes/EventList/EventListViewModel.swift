//
//  EventListViewModel.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 11.04.2023.
//

import Foundation
import CoreData

enum KeyProperties {
    static let id = "id"
    static let createAt = "createdAt"
    static let parameters = "parameters"
}

protocol EventListProtorol: AnyObject {
    
    var allEvents: [NSManagedObject] { get set }
    
    func eventID(index: Int) -> String?
    func eventDate(index: Int) -> String?
    func reloadData(completion: @escaping () -> Void)
    func deleteEvent(index: Int)
    func search(searchText: String)
}

final class EventListViewModel: EventListProtorol {
    
    
    private let eventManager = EventManager()
    
    var allEvents: [NSManagedObject] = []
 
    init() {
        allEvents = eventManager.allEvents()
    }
    
    
    func eventID(index: Int) -> String? {
        allEvents[index].value(forKey: KeyProperties.id) as? String ?? "Not Events"
    }
    
    func eventDate(index: Int) -> String? {
        guard let eventDate = allEvents[index].value(forKey: KeyProperties.createAt) as? Date else { return "Not Date" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let timeString = dateFormatter.string(from: eventDate)
        return timeString
    }
    
    func reloadData(completion: @escaping () -> Void) {
        allEvents = eventManager.allEvents()
        completion()
    }
    
    func deleteEvent(index: Int) {
        eventManager.deleteEvent(index: index)
        allEvents.remove(at: index)
    }
    
    func search(searchText: String) {
        
        
        for (index, event) in allEvents.enumerated() where
        event.value(forKey: KeyProperties.id) as? String == searchText {
            
            let removeItem = allEvents.remove(at: index)
            allEvents.insert(removeItem, at: 0)
        }
    }
}
