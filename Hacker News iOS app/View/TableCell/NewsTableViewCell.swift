//
//  NewsTableViewCell.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 8/22/25.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let pointsLabel = UILabel()
    let commentsLabel = UILabel()
    let pointsIcon = UIImageView()
    let commentsIcon = UIImageView()
    let rightChevronIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .black
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .lightGray
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
        
        pointsIcon.image = UIImage(systemName: "clock")
        pointsIcon.tintColor = .systemBlue
        pointsIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pointsIcon)
        
        pointsLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        pointsLabel.textColor = .systemBlue
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pointsLabel)
        
        commentsIcon.image = UIImage(systemName: "text.bubble")
        commentsIcon.tintColor = .systemOrange
        commentsIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(commentsIcon)
        
        commentsLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        commentsLabel.textColor = .systemOrange
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(commentsLabel)
        
        rightChevronIcon.image = UIImage(systemName: "chevron.right")
        rightChevronIcon.tintColor = .systemBlue
        rightChevronIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightChevronIcon)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            pointsIcon.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            pointsIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            pointsIcon.widthAnchor.constraint(equalToConstant: 16),
            pointsIcon.heightAnchor.constraint(equalToConstant: 16),
            
            pointsLabel.centerYAnchor.constraint(equalTo: pointsIcon.centerYAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: pointsIcon.trailingAnchor, constant: 6),
            
            commentsIcon.centerYAnchor.constraint(equalTo: pointsIcon.centerYAnchor),
            commentsIcon.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: 20),
            commentsIcon.widthAnchor.constraint(equalToConstant: 16),
            commentsIcon.heightAnchor.constraint(equalToConstant: 16),
            
            commentsLabel.centerYAnchor.constraint(equalTo: commentsIcon.centerYAnchor),
            commentsLabel.leadingAnchor.constraint(equalTo: commentsIcon.trailingAnchor, constant: 6),
            commentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            rightChevronIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightChevronIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rightChevronIcon.widthAnchor.constraint(equalToConstant: 12),
            rightChevronIcon.heightAnchor.constraint(equalToConstant: 16),
            
        ])
    }
    
    func configure(with news: NewsII) {
        titleLabel.text = news.title
        subtitleLabel.text = "\(news.author ?? "Unknown") . \(news.created_at ?? "Unknown") . by \(news.author ?? "Unknown")"
        pointsLabel.text = "\(news.points ?? 0)"
        commentsLabel.text = "\(news.num_comments ?? 0)"
    }
}
