//
//  TableViewCell.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 10.04.2023.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TableViewCell {
    
    func addSubview() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(3)
            make.leading.trailing.equalTo(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(27)
            make.leading.trailing.equalTo(10)
        }
    }
}

