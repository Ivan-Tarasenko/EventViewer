//
//  DetailEvent.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 17.04.2023.
//

import UIKit

final class DetailEventViewController: UITableViewController {
    
    // MARK: - Outlets
    private lazy var deleteButtonItem = UIBarButtonItem(
        title: "Delete",
        style: .plain,
        target: self,
        action: #selector(DetailEventViewController.deleteEvent)
    )
    
    // MARK: - Variables
    var indexCell = 0
    var eventManager: EventManager!
    
    private let dataSource: DetailEventDataSource
    private let delegate: DetailEventDelegate
    private var viewModel: DetailEventModelProtocol!
    
    // MARK: - LifeCycle
    init(dataSource: DetailEventDataSource, delegate: DetailEventDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailEventViewModel(eventManager: eventManager, indexCell: indexCell)
        configerUI()
        bing()
        
//        viewModel.getParaneterOfEvent(index: indexCell)
    }
    
    // MARK: - Configere
    private func configerUI() {
        navigationItem.leftBarButtonItem = self.deleteButtonItem
        navigationItem.title = "Event Details"
        tableView.register(DetailEventTableCell.self, forCellReuseIdentifier: DetailEventTableCell.identifier)
    }
    
    private func bing() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        dataSource.viewModel = viewModel
    }
    
    // MARK: - Actions
    @objc
    private func deleteEvent() {
        print("delete")
        dismiss(animated: true)
    }
}
