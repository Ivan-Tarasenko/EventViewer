//
//  DetailEventTableCell.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 17.04.2023.
//

import UIKit

final class DetailEventTableCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
