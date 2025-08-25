//
//  SettingsViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/25/25.
//

import UIKit

struct Settings {
    var title : String
    var lefticon : String
    var righticon : String
}

class SettingsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var settings : UILabel!
    var settingsI : [String] = [ "Airplane Mode", "Wi-Fi", "Bluetooth", "Cellular", "Battery", "General", "Accessibility", "Camera", "Control Center", "Display & Brightness", "HomeScreen& App Library"]
    var settingsITable : UITableView!
    
    var settingsList : [Settings] = [
        Settings(title: "Airplane Mode", lefticon: "airplane", righticon: "chevron.right"),
        Settings(title: "Wi-Fi", lefticon: "wifi", righticon: "chevron.right"),
        Settings(title: "Bluetooth", lefticon: "phone.connection.fill", righticon: "chevron.right"),
        Settings(title: "Cellular", lefticon: "ntenna.radiowaves.left.and.right", righticon: "chevron.right"),
        Settings(title: "Battery", lefticon: "battery.100percent", righticon: "chevron.right")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTable()
    }
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        settings = UILabel()
        settings.text = "Settings"
        settings.font = .systemFont(ofSize: 36, weight: .bold)
        settings.textAlignment = .left
        settings.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settings)
        
        NSLayoutConstraint.activate([
            settings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            settings.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            settings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        
    }
    
    func setupTable() {
        settingsITable = UITableView()
        settingsITable.translatesAutoresizingMaskIntoConstraints = false
        settingsITable.backgroundColor = .systemBackground
        settingsITable.delegate = self
        settingsITable.dataSource = self
        
        settingsITable.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        
        view.addSubview(settingsITable)
        
        NSLayoutConstraint.activate([
            settingsITable.topAnchor.constraint(equalTo: settings.bottomAnchor, constant: 24),
            settingsITable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            settingsITable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            settingsITable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }
        
        return settingsI.count - 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        if indexPath.section == 0 {
            cell.textLabel?.text = settingsI[indexPath.row]
        }
        else {
            cell.textLabel?.text = settingsI[indexPath.row + 5]
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground
        return headerView
    }
}
