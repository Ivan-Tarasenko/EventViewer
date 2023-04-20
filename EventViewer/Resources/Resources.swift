//
//  Resources.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 19.04.2023.
//

import Foundation

enum KeyProperties {
    static let id = "id"
    static let createAt = "createdAt"
    static let parameters = "parameters"
}

enum KeyParameters {
    static let key = "key"
    static let stringValue = "stringValue"
    static let integerValue = "integerValue"
    static let booleanValue = "booleanValue"
}

enum LocalizationString {
    static let idEvent = NSLocalizedString("idEvent", comment: "")
    static let dateEvent = NSLocalizedString("dateEvent", comment: "")
    static let parameterEvent = NSLocalizedString("parameterEvent", comment: "")
    
    static let key = NSLocalizedString("key", comment: "")
    static let string = NSLocalizedString("string", comment: "")
    static let int = NSLocalizedString("int", comment: "")
    static let bool = NSLocalizedString("bool", comment: "")
}

enum ErrorTitle {
    static let noParameter = NSLocalizedString("noParameter", comment: "")
}
