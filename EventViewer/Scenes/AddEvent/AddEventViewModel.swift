//
//  AddEventViewModel.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 20.04.2023.
//

import Foundation

protocol AddEventModelProtocol: AnyObject {
    
    var titlesSection: [String] { get }
    var titlesEnterParameter: [String] { get }
}

final class AddEventViewModel: AddEventModelProtocol {
    
    let eventManager: EventManager
    
    var titlesSection: [String] = []
    var titlesEnterParameter: [String] = []
    
    init(eventManager: EventManager) {
        self.eventManager = eventManager
        
        addTitleSection()
        addTitleParameter()
    }
    
    private func addTitleSection() {
        titlesSection.append(R.LocalizationString.idEvent)
        titlesSection.append(R.LocalizationString.dateEvent)
        titlesSection.append(R.LocalizationString.parameterEvent)
    }
    
    private func addTitleParameter() {
        titlesEnterParameter.append(R.CreateEvent.enterKey)
        titlesEnterParameter.append(R.CreateEvent.EnterString)
        titlesEnterParameter.append(R.CreateEvent.EnterInt)
        titlesEnterParameter.append(R.CreateEvent.EnterBool)
        
    }
    
}
