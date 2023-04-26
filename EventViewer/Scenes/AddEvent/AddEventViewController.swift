//
//  AddEventController.swift
//  EventViewer
//
//  Created by Иван Тарасенко on 20.04.2023.
//

import UIKit

final class AddEventViewController: UITableViewController {
    
    // MARK: - Outlets
    private lazy var createButtonItem = UIBarButtonItem(
        title: "Create",
        style: .plain,
        target: self,
        action: #selector(AddEventViewController.createEvent)
    )
    
    private lazy var cancelButtonItem = UIBarButtonItem(
        title: "Cancel",
        style: .plain,
        target: self,
        action: #selector(AddEventViewController.cancelEvent)
    )
    
    // MARK: - Variables
    let auxiliaryFunctions = AuxiliaryFunctions.shared
    var eventManager: EventManager!
    
    private let dataSource: AddEventDataSource
    private let delegate: AddEventDelegate
    private var viewModel: AddEventViewModel!
    
    // MARK: - LifeCycle
    init(dataSource: AddEventDataSource, delegate: AddEventDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventManager.capture(.detailScreen("DETAIL_OF_EVENT"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddEventViewModel(eventManager: eventManager)
        configerUI()
        bing()
        tapCell()
    }
    
    // MARK: - Configere
    private func configerUI() {
        navigationItem.leftBarButtonItem = self.createButtonItem
        navigationItem.rightBarButtonItem = self.cancelButtonItem
        navigationItem.title = "Create Event"
        tableView.register(AddEventTableViewCell.self, forCellReuseIdentifier: AddEventTableViewCell.identifier)
    }
    
    private func bing() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        dataSource.viewModel = viewModel
    }
    
    // MARK: - Actions
    @objc
    private func createEvent() {
        
        dismiss(animated: true)
    }
    
    @objc
    private func cancelEvent() {
        dismiss(animated: true)
    }
    
    private func tapCell() {
        delegate.onTapCell = { [weak self] section, index in
            guard let self else { return }
            switch section {
            case 0: self.EnterID()
            case 1: print("1")
            case 2: print("2")
            default:
                break
            }
        }
    }

    // MARK: - Additional functions
    private func EnterID() {
        auxiliaryFunctions.showAlert(on: self, title: R.TitleAlert.titleID,massage: R.CreateEvent.enterID) { text in
             print(text)
         }
    }
}


extension AddEventViewController: UITextFieldDelegate {
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         return "ABCDEFGHIJKLMNOPQRSTUVWXYZ ".lowercased().contains(string.lowercased())
    }
}
