//
//  ContactsViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/26/25.
//

import UIKit

class ContactsViewController: UIViewController {
    
    //MARK: Properties
    
    var contactsLabel : UILabel!
    var contactsTableView : UITableView! = UITableView()
    var searchBar: UISearchBar! = UISearchBar()
    
    var contacts : [Contact] = []
    var filteredData: [Contact] = []
    
    var isSearch: Bool = false
    
    //MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = Contact.getContactsList()
        
        setupDelegate()
        setupUI()
        setupSearchBar()
        setupTable()
    }
    
    func setupDelegate(){
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        searchBar.delegate = self
    }
}

// MARK: - TableView DataSource & Delegate

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsTableViewCell
        //        let contact = contacts[indexPath.row]
        let contact = isSearch ? filteredData[indexPath.row] : contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? filteredData.count : contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
 
// MARK: - SearchBar Delegate methods

extension ContactsViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty {
                isSearch = false
                filteredData.removeAll()
        } else {
            isSearch = true
            filteredData = contacts.filter { contact in
                contact.name.lowercased().contains(searchText.lowercased())
            }
        }
        contactsTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        isSearch = false
        contactsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Helper methods

extension ContactsViewController {
    func setupUI() {
        view.backgroundColor = .systemCyan
        
        contactsLabel = UILabel()
        contactsLabel.text = "Contacts"
        contactsLabel.textAlignment = .center
        contactsLabel.textColor = .white
        contactsLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        contactsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactsLabel)
        
        NSLayoutConstraint.activate([
            contactsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            contactsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupSearchBar() {
        
        searchBar.placeholder = "Search Settings"
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor, constant: 12),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupTable() {
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.separatorStyle = .singleLine
        contactsTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "ContactsCell")
        view.addSubview(contactsTableView)
        
        NSLayoutConstraint.activate([
            contactsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            contactsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
