//
//  EventsListViewController.swift
//  EventViewer
//
//  Created by Ilya Kharlamov on 1/26/23.
//

import UIKit

class EventsListViewController: UITableViewController {
    
    // MARK: - Outlets
    
    private lazy var logoutBarButtonItem = UIBarButtonItem(
        title: "Logout",
        style: .plain,
        target: self,
        action: #selector(EventsListViewController.logout)
    )
    
    // MARK: - Variables
    
    private let eventManager: EventManager
    private let dataSource: TableViewDataSourse
    private let delegate: TableViewDelegate
    private var viewModel: EventListProtorol!
    
    // MARK: - Lifecycle
    
    init(eventManager: EventManager, dataSourse: TableViewDataSourse, delegate: TableViewDelegate) {
        self.eventManager = eventManager
        self.dataSource = dataSourse
        self.delegate = delegate
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventManager.getAllEvent()
        configureUI()
        bing()
        
        viewModel = EventListViewModel()
        
        
        print(eventManager.allEvents.count)
//        print(eventManager.lastDateOfEvent("VIEW_SCREEN"))
//        let test = eventManager.allEvent[0]
//        print(test.value(forKey: "createdAt"))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventManager.capture(.viewScreen("EVENTS_LIST"))
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        navigationItem.title = "Events List"
        navigationItem.rightBarButtonItem = self.logoutBarButtonItem
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    private func bing() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
//        dataSource.events = viewModel
    }
    
    // MARK: - Actions
    
    @objc
    private func logout() {
        eventManager.capture(.logout)
        let vc = LoginViewController(eventManager: eventManager)
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
    
}
