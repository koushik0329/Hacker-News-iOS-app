//
//  CarMakersViewController.swift
//  CarMakers
//
//  Created by Koushik Reddy Kambham on 9/2/25.
//

import UIKit

struct CarModel {
    let name: String
    let info: String
}

struct CarMaker {
    let maker: String
    let cars: [CarModel]
}


class CarMakersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var carMakers: [CarMaker] = [
        CarMaker(maker: "Tesla", cars: [
            CarModel(name: "Model S", info: "Luxury electric sedan with long range and fast acceleration."),
            CarModel(name: "Model 3", info: "Affordable electric car with great performance."),
            CarModel(name: "Model X", info: "Electric SUV with falcon-wing doors.")
        ]),
        CarMaker(maker: "Toyota", cars: [
            CarModel(name: "Camry", info: "Reliable midsize sedan with excellent fuel efficiency."),
            CarModel(name: "Corolla", info: "Compact sedan known for reliability and affordability."),
            CarModel(name: "RAV4", info: "Compact SUV with hybrid options and great utility.")
        ]),
        CarMaker(maker: "BMW", cars: [
            CarModel(name: "X5", info: "Luxury SUV with sporty performance and premium interiors."),
            CarModel(name: "3 Series", info: "Sporty luxury sedan with a balance of comfort and power."),
            CarModel(name: "i4", info: "BMW’s premium electric sedan with great range and tech.")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Car Makers"
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Table View DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return carMakers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carMakers[section].cars.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return carMakers[section].maker
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = carMakers[indexPath.section].cars[indexPath.row]
        cell.textLabel?.text = car.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = carMakers[indexPath.section].cars[indexPath.row]
        showCarInfoAlert(car: car)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func showCarInfoAlert(car: CarModel) {
        let alert = UIAlertController(title: car.name, message: car.info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        present(alert, animated: true)
    }
}
