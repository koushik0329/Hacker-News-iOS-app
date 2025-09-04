//
//  ContactsSearchViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/2/25.
//

import UIKit

class ContactsSearchViewController : UIViewController {
    var searchBar: UISearchBar!
    var tableView: UITableView!
    
    var contacts : [SearchContact] = []
    var filteredData : [SearchContact] = []
    
    var isSearching : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = SearchContact.getContacts()
        
        setupSearchBar()
        setupTableView()
    }
}

extension ContactsSearchViewController : UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredData = []
        }
        else {
            isSearching = true
            filteredData = contacts.filter { contact in
                contact.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}

extension ContactsSearchViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredData.count : contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactsSearchTableView else {
            fatalError("Could not dequeue cell")
        }
        let contact = isSearching ? filteredData[indexPath.row] : contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
}

extension ContactsSearchViewController {
    func setupSearchBar() {
        
        searchBar = UISearchBar()
        searchBar.placeholder = "Search contacts"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupTableView() {
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactsSearchTableView.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
       ])
            
    }
}
