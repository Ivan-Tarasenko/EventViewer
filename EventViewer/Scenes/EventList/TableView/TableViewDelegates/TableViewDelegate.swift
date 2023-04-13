//
//  TableViewDelegate.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 09.04.2023.
//

import UIKit

final class TableViewDelegate: NSObject, UITableViewDelegate {

    var onScrollAction: (() -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height {
             onScrollAction?()
         }
    }
}
