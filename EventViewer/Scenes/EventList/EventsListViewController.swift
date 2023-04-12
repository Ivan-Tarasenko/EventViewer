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
    private var viewModel: EventListProtorol = EventListViewModel()
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
        configureUI()
        bing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventManager.capture(.viewScreen("EVENTS_LIST"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.reloadData {
            self.tableView.reloadData()
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
                if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height {
//                    self.fetchNextPage()
                   
                }
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
        dataSource.viewModel = viewModel
    }
    
    // MARK: - Actions
    
    @objc
    private func logout() {
        eventManager.capture(.logout)
        let vc = LoginViewController(eventManager: eventManager)
        
        vc.onReloadData = {
            self.viewModel.reloadData {
                self.tableView.reloadData()
            }
        }
        
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
    
}
