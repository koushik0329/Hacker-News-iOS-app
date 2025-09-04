//
//  SpotifyTableViewCell.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/2/25.
//

import UIKit

class SpotifyTableViewCell: UITableViewCell {
    
    let imageViewSpotify = UIImageView()
    let labelTitle = UILabel()
    let labelArtist = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        imageViewSpotify.contentMode = .scaleAspectFit
        imageViewSpotify.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageViewSpotify)
        
        labelTitle.font = .systemFont(ofSize: 17, weight: .medium)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textColor = .label
        contentView.addSubview(labelTitle)
        
        labelArtist.font = .systemFont(ofSize: 13, weight: .regular)
        labelArtist.translatesAutoresizingMaskIntoConstraints = false
        labelArtist.textColor = .secondaryLabel
        contentView.addSubview(labelArtist)
        
        NSLayoutConstraint.activate([
            imageViewSpotify.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageViewSpotify.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageViewSpotify.widthAnchor.constraint(equalToConstant: 50),
            imageViewSpotify.heightAnchor.constraint(equalToConstant: 50),
            
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            labelTitle.leadingAnchor.constraint(equalTo: imageViewSpotify.trailingAnchor, constant: 16),
            labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            labelArtist.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 8),
            labelArtist.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelArtist.heightAnchor.constraint(equalToConstant: 21),
            
        ])
    }
    
    func configure(with spotify : Spotify) {
        imageViewSpotify.image = UIImage(named: spotify.image)
        labelTitle.text = spotify.title
        labelArtist.text = spotify.artist
    }
}
