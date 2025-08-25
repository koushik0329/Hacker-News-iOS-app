//
//  SettingsViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/25/25.
//

import UIKit

struct Settings {
    var title: String
    var lefticon: String
    var righticon: String
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var settingsLabel: UILabel!
    var settingsTable: UITableView!
    
    var settingsList: [Settings] = [
        Settings(title: "Airplane Mode", lefticon: "airplane", righticon: "chevron.right"),
        Settings(title: "Wi-Fi", lefticon: "wifi", righticon: "chevron.right"),
        Settings(title: "Bluetooth", lefticon: "phone.connection.fill", righticon: "chevron.right"),
        Settings(title: "Cellular", lefticon: "antenna.radiowaves.left.and.right", righticon: "chevron.right"),
        Settings(title: "Battery", lefticon: "battery.100percent", righticon: "chevron.right"),
        Settings(title: "General", lefticon: "gearshape", righticon: "chevron.right"),
        Settings(title: "Accessibility", lefticon: "figure.wave", righticon: "chevron.right"),
        Settings(title: "Camera", lefticon: "camera", righticon: "chevron.right"),
        Settings(title: "Control Center", lefticon: "switch.2", righticon: "chevron.right"),
        Settings(title: "Display & Brightness", lefticon: "textformat.size", righticon: "chevron.right"),
        Settings(title: "Home Screen & App Library", lefticon: "square.grid.2x2", righticon: "chevron.right")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
    }
    
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
    
    private func setupTable() {
        settingsTable = UITableView(frame: .zero, style: .insetGrouped)
        settingsTable.translatesAutoresizingMaskIntoConstraints = false
        settingsTable.delegate = self
        settingsTable.dataSource = self
        settingsTable.backgroundColor = .systemGroupedBackground
        settingsTable.separatorStyle = .singleLine
        settingsTable.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        
        view.addSubview(settingsTable)
        
        NSLayoutConstraint.activate([
            settingsTable.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 24),
            settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    
    // MARK: - TableView DataSource & Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 5 : settingsList.count - 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        let setting = (indexPath.section == 0)
                    ? settingsList[indexPath.row]
                    : settingsList[indexPath.row + 5]
        cell.configure(with: setting)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 // Space above each section
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1 // Prevents unwanted footer space
    }

    
    
}
