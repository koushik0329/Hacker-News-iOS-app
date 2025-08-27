//
//  SettingsViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/25/25.
//

import UIKit



class SettingsViewController: UIViewController {
    
    //MARK: Properties
    
    var settingsLabel: UILabel!
    var searchBar: UISearchBar! = UISearchBar()
    var settingsTable: UITableView! = UITableView()
    
    var settingsList: [Settings] = []
    
    var filteredData: [Settings] = []
    var searching: Bool = false
    
    //MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsList = Settings.getSettingsList()
        
        setupUI()
        setupSearchBar()
        setupTable()
        setupDelegate()
    }
    
    func setupDelegate(){
        searchBar.delegate = self
        settingsTable.delegate = self
        settingsTable.dataSource = self
    }
}
    
    // MARK: - TableView DataSource & Delegate

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searching ? 1 : 6
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredData.count
        }
        switch section {
            case 0:
                return 5
            case 1:
                return 8
            case 2:
                return 4
            case 3:
                return 3
            case 4:
                return 3
            case 5:
                return settingsList.count - 23
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        
        let setting: Settings
        
        if searching {
            setting = filteredData[indexPath.row]
        }
        else {
            switch indexPath.section {
                case 0:
                    setting = settingsList[indexPath.row]
                case 1:
                    setting = settingsList[indexPath.row + 5]
                case 2:
                    setting = settingsList[indexPath.row + 13]
                case 3:
                    setting = settingsList[indexPath.row + 17]
                case 4:
                    setting = settingsList[indexPath.row + 20]
                case 5:
                    setting = settingsList[indexPath.row + 23]
                default:
                    fatalError("Invalid section")
                }
        }
        cell.configure(with: setting)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}

// MARK: - SearchBar Delegate methods

extension SettingsViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        if searchText.isEmpty {
            searching = false
            filteredData = []
        }
        else {
            searching = true
            filteredData = []
            filteredData = settingsList.filter {setting in
                setting.title.lowercased().contains(searchText.lowercased())
            }
        }
        settingsTable.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searching = false
        settingsTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Helper methods

extension SettingsViewController{
    
    func setupUI() {
        view.backgroundColor = .systemGroupedBackground
        
        settingsLabel = UILabel()
        settingsLabel.text = "Settings"
        settingsLabel.font = .systemFont(ofSize: 36, weight: .bold)
        settingsLabel.textAlignment = .left
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsLabel)
        
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    func setupSearchBar() {
        
        searchBar = UISearchBar()
        searchBar.placeholder = "Search Settings"
        filteredData = settingsList
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 12),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
    }
    
    func setupTable() {
        settingsTable = UITableView(frame: CGRect(x: 0, y: 100, width: 300, height: 500), style: .insetGrouped)
        settingsTable.translatesAutoresizingMaskIntoConstraints = false
        
        settingsTable.backgroundColor = .systemGroupedBackground
        settingsTable.separatorStyle = .singleLine
        settingsTable.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        
        view.addSubview(settingsTable)
        
        NSLayoutConstraint.activate([
            settingsTable.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
