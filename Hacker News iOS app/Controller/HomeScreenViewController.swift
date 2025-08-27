//
//  HomeScreenViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/22/25.
//

import UIKit

struct News {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
}

class HomeScreenViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var newsList: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        
        let news1: News = News(id: "1", title: "Show 1", num_comments: 10, points: 100, url: "https://www.google.com", author: "Koushik", created_at: "2025-08-22T12:00:00Z")
        newsList.append(news1)
        
        newsList = [
            News(id: "1", title: "Show HN: Draw a fish and watch it swim with the others", num_comments: 211, points: 813, url: nil, author: "hallak", created_at: "4 days ago"),
            News(id: "2", title: "At 17, Hannah Cairo solved a major math mystery", num_comments: 125, points: 246, url: nil, author: "baruchel", created_at: "12 hours ago"),
            News(id: "3", title: "Replacing tmux in my dev workflow", num_comments: 275, points: 242, url: nil, author: "elashri", created_at: "20 hours ago"),
            News(id: "4", title: "Cerebras Code", num_comments: 99, points: 236, url: nil, author: "d3vr", created_at: "7 hours ago"),
            News(id: "5", title: "I couldn't submit a PR, so I got hired and fixed it myself", num_comments: 119, points: 206, url: nil, author: "skeptrune", created_at: "12 hours ago"),
            News(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: nil, author: "shuuji3", created_at: "11 hours ago"),
            
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else { return UITableViewCell()}
        let news: News = newsList[indexPath.row]
        cell.cellTitleLabel.text = news.title
        cell.cellAuthorLastSeen.text = "\(news.author ?? "Unknown") . \(news.created_at ?? "Unknown") . by \(news.author ?? "Unknown")"
        cell.cellPoints.text = "\(news.points ?? 0)"
        cell.cellCommentsLabel.text = "\(news.num_comments ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
