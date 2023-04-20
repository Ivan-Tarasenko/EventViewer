//
//  DetailEventTableCell.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 17.04.2023.
//

import UIKit
import SnapKit

final class DetailEventTableCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(titleLabel)
        contentView.addSubview(textView)
    }
    
    private func addConstraint() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(10)
        }
        
        textView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(160)
            make.height.equalTo(35)
            make.trailing.equalTo(-10)
        }
    }
    
    func removeTextView() {
        textView.removeFromSuperview()
    }
}
