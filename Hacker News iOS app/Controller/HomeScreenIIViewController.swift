//
//  HomeScreenIIViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/22/25.
//

import UIKit

class HomeScreenIIViewController : UIViewController {
    
    //MARK: Properties
    
    var newsLabel : UILabel!
    var newsTable : UITableView!
    
    var newsList : [NewsII] = []
    
    //MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsList = NewsII.getNewsIIList()
        
        setupUI()
        setupTable()
    }
}

// MARK: - TableView DataSource & Delegate

extension HomeScreenIIViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsTableViewCell else {
                    return UITableViewCell()
                }
                
        let news: NewsII = newsList[indexPath.row]
        cell.configure(with: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

// MARK: - Helper methods

extension HomeScreenIIViewController {
    func setupUI() {
        
        view.backgroundColor = .black
        
        newsLabel = UILabel()
        newsLabel.text = "News"
        newsLabel.textColor = .white
        newsLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        newsLabel.textAlignment = .left
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newsLabel)
        
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 285)
        ])
    }
    
    func setupTable() {
        newsTable = UITableView()
        newsTable.translatesAutoresizingMaskIntoConstraints = false
        newsTable.backgroundColor = .clear
        newsTable.separatorColor = .darkGray
        newsTable.delegate = self
        newsTable.dataSource = self
        
        newsTable.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsCell")
        
        view.addSubview(newsTable)
        
        NSLayoutConstraint.activate([
            newsTable.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 20),
            newsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
