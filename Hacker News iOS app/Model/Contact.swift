//
//  Contact.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/27/25.
//

struct Contact {
    var profilePicture : String
    var name : String
    var position : String
    var country : String
    
    static func getContactsList() -> [Contact] {
        return [
            Contact(profilePicture: "sample", name: "Mohammad Hussain", position: "SEO Specialist", country: "Argentina"),
            Contact(profilePicture: "sample1", name: "John Young", position: "Interactive Designer", country: "Bolivia"),
            Contact(profilePicture: "sample", name: "Tamilarasi Mohan", position: "Architect", country: "Albania"),
            Contact(profilePicture: "sample1", name: "Kim Yu", position: "Economist", country: "Brazil"),
            Contact(profilePicture: "sample", name: "Derek Fowler", position: "Web Strategist", country: "Argentina"),
            Contact(profilePicture: "sample", name: "Shreya Nithin", position: "Product Designer", country: "Azerbaijan"),
            Contact(profilePicture: "sample1", name: "Emily Adams", position: "Editor", country: "Bolivia")
        ]
    }
}
