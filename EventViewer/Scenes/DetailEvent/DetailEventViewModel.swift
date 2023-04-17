//
//  DetailEventViewModel.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 17.04.2023.
//

import Foundation
import CoreData

protocol DetailEventModelProtocol: AnyObject {
    
    func eventID(index: Int) -> String?
    func paraneters(index: Int) -> Set<DBParameter>?
}

final class DetailEventViewModel: DetailEventModelProtocol {
    
    let eventManager: EventManager?
    
    var allEvents: [NSManagedObject] = []
    
    init(eventManager: EventManager) {
        self.eventManager = eventManager
        allEvents = eventManager.events
    }
    
    func eventID(index: Int) -> String? {
        guard !allEvents.isEmpty else { return "No Events" }
        return allEvents[index].value(forKey: KeyProperties.id) as? String
    }
    
    func paraneters(index: Int) -> Set<DBParameter>? {
        guard !allEvents.isEmpty else { return nil }
        
        let test = allEvents[index].value(forKey: KeyProperties.parameters) as? Set<DBParameter>
       
        for i in test! {
            print("Параметр ключ: \(i.value(forKey: "key"))")
            print("Параметр стринг: \(i.value(forKey: "stringValue"))")
            print("Параметр инт: \(i.value(forKey: "integerValue"))")
            print("Параметр бул: \(i.value(forKey: "booleanValue"))")
            print("Параметр массив: \(i.value(forKey: "arrayValue"))")
            print("Параметр евент: \(i.value(forKey: "event"))")
        }
        
        return test
    }
}
