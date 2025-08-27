//
//  ContactsTableViewCell.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/26/25.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    let pictureImageView = UIImageView()
    let nameLabel = UILabel()
    let positionLabel = UILabel()
    let countryImageView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        backgroundColor = .systemBackground
        
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.contentMode = .scaleAspectFill
        contentView.addSubview(pictureImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .label
        contentView.addSubview(nameLabel)
        
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = .systemFont(ofSize: 14, weight: .bold)
        positionLabel.backgroundColor = .systemCyan
        positionLabel.textColor = .white
        positionLabel.layer.masksToBounds = true
        positionLabel.layer.cornerRadius = 8
        positionLabel.textAlignment = .center
        contentView.addSubview(positionLabel)
        
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        countryImageView.contentMode = .scaleAspectFit
        contentView.addSubview(countryImageView)
        
        NSLayoutConstraint.activate([
            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            pictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pictureImageView.widthAnchor.constraint(equalToConstant: 75),
            pictureImageView.heightAnchor.constraint(equalToConstant: 75),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: countryImageView.centerXAnchor, constant: -8),
            
            positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            positionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            positionLabel.heightAnchor.constraint(equalToConstant: 24),
            
            countryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            countryImageView.widthAnchor.constraint(equalToConstant: 32),
            countryImageView.heightAnchor.constraint(equalToConstant: 32),
            
        ])
    }
    
    func configure(with contact : Contact){
        pictureImageView.image = UIImage(named: contact.profilePicture)
        nameLabel.text = contact.name
        positionLabel.text = contact.position
//        countryImageView.image = UIImage(systemName: "flag")
        countryImageView.image = UIImage(named: contact.country)
    }
    
}
