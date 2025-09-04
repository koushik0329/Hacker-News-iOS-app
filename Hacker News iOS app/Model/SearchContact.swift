//
//  SearchContact.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/29/25.
//

struct SearchContact {
    var name: String
    
    static func getContacts() -> [SearchContact] {
        [
            SearchContact(name: "Alice"),
            SearchContact(name: "Bob"),
            SearchContact(name: "Charlie"),
            SearchContact(name: "David"),
            SearchContact(name: "Eva"),
            SearchContact(name: "Frank"),
            SearchContact(name: "Grace"),
        ]
    }
}
