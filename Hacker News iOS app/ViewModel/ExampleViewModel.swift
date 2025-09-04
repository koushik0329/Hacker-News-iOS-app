//
//  ExampleViewModel.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/3/25.
//

import Foundation

class ExampleViewModel {
    
    var EmpList: [Emp] = []
    
    init() {
        self.EmpList = getEmp()
    }

     func getEmp() -> [Emp] {
        [
            Emp(name: "kosushik", id: 1),
            Emp(name: "koushik", id: 2),
        ]
    }
    
    func getEmployeeCount() -> Int {
        EmpList.count
    }
    
    func getEmployee(at index: Int) -> Emp {
        return EmpList[index]
    }

}
