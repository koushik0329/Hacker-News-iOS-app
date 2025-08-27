//
//  HomeScreenIIViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/22/25.
//

import UIKit

struct NewsII {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
}

class HomeScreenIIViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newsLabel : UILabel!
    var newsTable : UITableView!
    
    var newsList : [NewsII] = [
        NewsII(id: "1", title: "Show HN: Draw a fish and watch it swim with the others", num_comments: 211, points: 813, url: nil, author: "hallak", created_at: "4 days ago"),
        NewsII(id: "2", title: "At 17, Hannah Cairo solved a major math mystery", num_comments: 125, points: 246, url: nil, author: "baruchel", created_at: "12 hours ago"),
        NewsII(id: "3", title: "Replacing tmux in my dev workflow", num_comments: 275, points: 242, url: nil, author: "elashri", created_at: "20 hours ago"),
        NewsII(id: "4", title: "Cerebras Code", num_comments: 99, points: 236, url: nil, author: "d3vr", created_at: "7 hours ago"),
        NewsII(id: "5", title: "I couldn't submit a PR, so I got hired and fixed it myself", num_comments: 119, points: 206, url: nil, author: "skeptrune", created_at: "12 hours ago"),
        NewsII(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: nil, author: "shuuji3", created_at: "11 hours ago")

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTable()
    }

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
