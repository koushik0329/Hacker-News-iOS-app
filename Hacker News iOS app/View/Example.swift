//
//  Example.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/26/25.
//

import UIKit

struct Emp {
    var name: String
    var id: Int
}

class Example: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var nameLabel : UILabel!
    var tableView : UITableView!
    
    var employees : [Emp] = [
        Emp(name: "kosushik", id: 1),
        Emp(name: "koushik", id: 2),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTable()
    }
    
    func setupUI(){
        nameLabel = UILabel()
        nameLabel.text = "Hello, World!"
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        print("asdnk ")
     
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
    }
    
    func setupTable() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExampleTableViewCell.self, forCellReuseIdentifier: "Examplecell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Examplecell", for: indexPath) as! ExampleTableViewCell
        cell.configure(with: employees[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    
}
