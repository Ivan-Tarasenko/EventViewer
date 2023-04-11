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
    
//    var allEvents: [NSManagedObject] { get }
    
//    init(_ eventManager: EventManagerProtocol)
    
    func eventID(index: Int) -> String?
    func eventDate(index: Int) -> String?
}

final class EventListViewModel: EventListProtorol {
    
    
    private let eventManager = EventManager()
    
    
//    var allEvents: [NSManagedObject] { return eventManager?.allEvents ?? [] }
    
    func eventID(index: Int) -> String? {
        print(eventManager.allEvents)
//        allEvents[index].value(forKey: KeyProperties.id) as? String ?? "Not Events"
        return ""
    }
    
    func eventDate(index: Int) -> String? {
        guard let eventDate = eventManager.allEvents[index].value(forKey: KeyProperties.createAt) as? Date else { return "Not Date" }
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        let timeString = dateFormatter.string(from: eventDate)
        return timeString
    }
}
