//
//  HomeScreenIIViewModel.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/4/25.
//

import Foundation

class HomeScreenIIViewModel {
    
    private var newsList: [NewsII] = []
    
    init() {
        loadNews()
    }
    
    private func loadNews() {
        self.newsList = [
            NewsII(id: "1", title: "Show HN: Draw a fish and watch it swim with the others", num_comments: 211, points: 813, url: nil, author: "hallak", created_at: "4 days ago"),
            NewsII(id: "2", title: "At 17, Hannah Cairo solved a major math mystery", num_comments: 125, points: 246, url: nil, author: "baruchel", created_at: "12 hours ago"),
            NewsII(id: "3", title: "Replacing tmux in my dev workflow", num_comments: 275, points: 242, url: nil, author: "elashri", created_at: "20 hours ago"),
            NewsII(id: "4", title: "Cerebras Code", num_comments: 99, points: 236, url: nil, author: "d3vr", created_at: "7 hours ago"),
            NewsII(id: "5", title: "I couldn't submit a PR, so I got hired and fixed it myself", num_comments: 119, points: 206, url: nil, author: "skeptrune", created_at: "12 hours ago"),
            NewsII(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: nil, author: "shuuji3", created_at: "11 hours ago")
        ]
    }
    
    func getNewsListCount() -> Int {
        return newsList.count
    }
    
    func getNewsII(at index: Int) -> NewsII? {
        guard index >= 0 && index < newsList.count else { return nil }
        return newsList[index]
    }
    
    func getNewsHeight() -> CGFloat {
        return 110
    }
}
