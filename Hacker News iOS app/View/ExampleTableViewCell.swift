//
//  ExampleTableViewCell.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/26/25.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let idLabel = UILabel()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(idLabel)
        
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            nameLabel.centerXAnchor.constraint(equalTo: idLabel.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor, constant: 10),
        ])
    }
    
    func configure(with emp : Emp) {
        nameLabel.text = emp.name
        idLabel.text = "\(emp.id)"
    }
}
