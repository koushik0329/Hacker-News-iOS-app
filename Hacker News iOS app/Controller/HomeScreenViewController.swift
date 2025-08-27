//
//  HomeScreenViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/22/25.
//

import UIKit

class HomeScreenViewController : UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var listTableView: UITableView!
    
    var newsList: [News] = []
    
    //MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        newsList = News.getNewsList()
    }
}

// MARK: - TableView DataSource & Delegate
 
extension HomeScreenViewController : UITableViewDataSource, UITableViewDelegate {
    
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

// MARK: - Helper methods

extension HomeScreenViewController {
    func setDelegate() {
        listTableView.dataSource = self
        listTableView.delegate = self
    }
}
