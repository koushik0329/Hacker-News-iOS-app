//
//  Emp.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/27/25.
//

struct Emp {
    var name: String
    var id: Int
    
    static func getEmp() -> [Emp] {
        [
            Emp(name: "kosushik", id: 1),
            Emp(name: "koushik", id: 2),
        ]
    }
}
