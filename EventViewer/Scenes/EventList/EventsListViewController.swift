//
//  EventsListViewController.swift
//  EventViewer
//
//  Created by Ilya Kharlamov on 1/26/23.
//

import UIKit

class EventsListViewController: UITableViewController, UIScrollViewAccessibilityDelegate {
    
    // MARK: - Outlets
    
    private lazy var logoutBarButtonItem = UIBarButtonItem(
        title: "Logout",
        style: .plain,
        target: self,
        action: #selector(EventsListViewController.logout)
    )
    
    private lazy var addEventBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "plus"),
        style: .plain,
        target: self,
        action: #selector(EventsListViewController.addEvent)
    )
    
    private lazy var refresh = UIRefreshControl()
    private lazy var searchController = UISearchController()
    
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
        setupSearchController()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventManager.capture(.viewScreen("EVENTS_LIST"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        print("scroll")
        if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height {
            //                    self.fetchNextPage()
            
        }
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print("last")
        }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        navigationItem.title = "Events List"
        navigationItem.rightBarButtonItem = self.logoutBarButtonItem
        navigationItem.leftBarButtonItem = self.addEventBarButtonItem
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        refresh.addTarget(self, action: #selector(updateTable), for: .valueChanged)
        tableView.refreshControl = refresh
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
        
        vc.onReloadData = { [weak self] in
            guard let self else { return }
            self.reloadData()
        }
        
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
    
    @objc
    private func addEvent() {
        
    }
    
    @objc
    private func updateTable() {
        reloadData()
        refresh.endRefreshing()
    }
    
    private func reloadData() {
        viewModel.reloadData { [weak self] in
            guard let self else { return }
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }
    
}

// MARK: - Search
extension EventsListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            viewModel.search(searchText: searchText)
            tableView.reloadData()
        } else {
            reloadData()
        }
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       reloadData()
    }
    private func setupSearchController() {
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Event"
        searchController.searchBar.autocapitalizationType = .allCharacters
        navigationItem.searchController = searchController
    }
}
