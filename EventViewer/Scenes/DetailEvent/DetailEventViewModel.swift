//
//  DetailEventViewModel.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 17.04.2023.
//

import Foundation
import CoreData

protocol DetailEventModelProtocol: AnyObject {
    var paravetersOfEvent: [String: [String]] { get }
    var titleSection: [String] { get }
    var titleParameter: [String] { get }
}

final class DetailEventViewModel: DetailEventModelProtocol {
    
    let eventManager: EventManager
    let indexCell: Int
    var paravetersOfEvent: [String: [String]] = [:]
    var titleSection: [String] = []
    var titleParameter: [String] = []
    
    init(eventManager: EventManager, indexCell: Int) {
        self.eventManager = eventManager
        self.indexCell = indexCell
        
        addTitleSection()
        addTitleParameter()
        getParaneterOfEvent(index: indexCell)
    }
    
    private func addTitleSection() {
        titleSection.append(LocalizationString.idEvent)
        titleSection.append(LocalizationString.dateEvent)
        titleSection.append(LocalizationString.parameterEvent)
    }
    
    private func addTitleParameter() {
        titleParameter.append(LocalizationString.key)
        titleParameter.append(LocalizationString.string)
        titleParameter.append(LocalizationString.int)
        titleParameter.append(LocalizationString.bool)
        
    }
    
    private func getParaneterOfEvent(index: Int) {
        guard !eventManager.events.isEmpty else { return }
        
        
        if let id = eventManager.events[index].value(forKey: KeyProperties.id) as? String {
            paravetersOfEvent[KeyProperties.id] = [id]
        }
        
        if let createAt = eventManager.events[index].value(forKey: KeyProperties.createAt) as? Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            let timeString = dateFormatter.string(from: createAt)
            paravetersOfEvent[KeyProperties.createAt] = [timeString]
        }
        
        
        if let parameters = eventManager.events[index].value(forKey: KeyProperties.parameters) as? Set<DBParameter> {
            
            for parameter in parameters {
                
                // getting all the event parameters
                let key = parameter.value(forKey: KeyParameters.key) as? String
                let stringValue = parameter.value(forKey: KeyParameters.stringValue) as? String
                let integerValue = parameter.value(forKey: KeyParameters.integerValue) as? Int
                let booleanValue = parameter.value(forKey: KeyParameters.booleanValue) as? Bool
                
                // encode all parameters in JSONE format
                let encodedKey = try! JSONEncoder().encode(key)
                let encodedString = try! JSONEncoder().encode(stringValue)
                let encodedInt = try! JSONEncoder().encode(integerValue)
                let encodedBool = try! JSONEncoder().encode(booleanValue)
                
                // extracting data in String
                let jsonKey = String(data: encodedKey, encoding: .utf8)
                let jsonString = String(data: encodedString, encoding: .utf8)
                let jsonInt = String(data: encodedInt, encoding: .utf8)
                let jsonBool = String(data: encodedBool, encoding: .utf8)
                
                // adding all parameters to the dictionary
                paravetersOfEvent[KeyProperties.parameters] = [jsonKey!, jsonString!, jsonInt!, jsonBool!]
            }
        }
    }
}
