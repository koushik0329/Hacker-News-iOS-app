//
//  SettingsTableViewCell.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/25/25.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let leftIcon = UIImageView()
    let rightIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .systemBackground
        
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(leftIcon)
        
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightIcon)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: leftIcon.leadingAnchor, constant: -8),
            
            leftIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            leftIcon.leadingAnchor.constraint(equalTo: leftIcon.trailingAnchor, constant: 4),
            
            rightIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rightIcon.leadingAnchor.constraint(equalTo: rightIcon.trailingAnchor, constant: 8),
            
            
        ])
        textLabel?.font = .systemFont(ofSize: 17)
        textLabel?.textColor = .label
    }
    
    func configure(with settings: Settings) {
        titleLabel.text = settings.title
        leftIcon.image = UIImage(systemName: settings.lefticon)
        rightIcon.image = UIImage(systemName: settings.righticon)
    }
}
