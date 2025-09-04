//
//  Spotify.swift
//  Hacker News iOS app
//
//  Created by Koushik Reddy Kambham on 9/2/25.
//

struct Spotify {
    var image : String
    var title : String
    var artist : String
    
    static func getSpotifyData() -> [Spotify] {
        return [
            Spotify(image: "sample", title: "test", artist: "test"),
        ]
    }
}
