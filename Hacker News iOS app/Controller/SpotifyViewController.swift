//
//  SpotifyViewController.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/2/25.
//

import UIKit

class SpotifyViewController: UIViewController {
    
    var spotifyLabel: UILabel!
    var searchbar: UISearchBar!
    var spotifytableview: UITableView!
    
    var spotifyList: [Spotify] = []
    var filteredSpotifyList: [Spotify] = []
    
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spotifyList = Spotify.getSpotifyData()
        
        setupUI()
        setupSearchBar()
        setupTableView()
    }
}

extension SpotifyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredSpotifyList.count : spotifyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpotifyCell", for: indexPath) as? SpotifyTableViewCell else {
            return UITableViewCell()
        }
        let song = isSearching ? filteredSpotifyList[indexPath.row] : spotifyList[indexPath.row]
        cell.configure(with: song)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SpotifyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredSpotifyList = []
        }
        else {
            isSearching = true
            filteredSpotifyList = spotifyList.filter { spotify in spotify.title.lowercased().contains(searchText.lowercased())}
        }
        spotifytableview.reloadData()
    }
    
}

extension SpotifyViewController {
    func setupUI() {
        spotifyLabel = UILabel()
        spotifyLabel.textColor = .label
        spotifyLabel.textAlignment = .left
        spotifyLabel.text  = "Spotify"
        spotifyLabel.font = .systemFont(ofSize: 40, weight: .bold)
        spotifyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spotifyLabel)
        
        NSLayoutConstraint.activate([
            spotifyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            spotifyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    func setupSearchBar() {
        searchbar = UISearchBar()
        searchbar.placeholder = "Search"
        searchbar.delegate = self
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchbar)
        
        NSLayoutConstraint.activate([
            searchbar.topAnchor.constraint(equalTo: spotifyLabel.bottomAnchor, constant: 20),
            searchbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func setupTableView() {
        spotifytableview = UITableView()
        spotifytableview.translatesAutoresizingMaskIntoConstraints = false
        spotifytableview.dataSource = self
        spotifytableview.delegate = self
        spotifytableview.register(SpotifyTableViewCell.self, forCellReuseIdentifier: "SpotifyCell")
        view.addSubview(spotifytableview)
        
        NSLayoutConstraint.activate([
            spotifytableview.topAnchor.constraint(equalTo: searchbar.bottomAnchor, constant: 20),
            spotifytableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spotifytableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spotifytableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
