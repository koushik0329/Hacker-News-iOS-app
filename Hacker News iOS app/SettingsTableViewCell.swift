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
        
        leftIcon.contentMode = .scaleAspectFit
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        leftIcon.tintColor = .systemBlue
        contentView.addSubview(leftIcon)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        rightIcon.contentMode = .scaleAspectFit
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.tintColor = .systemGray
        contentView.addSubview(rightIcon)
        
        NSLayoutConstraint.activate([
            leftIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leftIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            leftIcon.widthAnchor.constraint(equalToConstant: 24),
            leftIcon.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leftIcon.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: rightIcon.leadingAnchor, constant: -12),

            rightIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rightIcon.widthAnchor.constraint(equalToConstant: 16),
            rightIcon.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func configure(with settings: Settings) {
        titleLabel.text = settings.title
        leftIcon.image = UIImage(systemName: settings.lefticon)
        rightIcon.image = UIImage(systemName: settings.righticon)
    }
}
