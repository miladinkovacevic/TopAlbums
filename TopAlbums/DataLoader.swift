//
//  DataLoader.swift
//  TopAlbums
//
//  Created by Miladin Kovacevic on 1/17/22.
//

import Foundation

public class DataLoader {
    var albums = [Album]()

    init() {
        load()
    }
    func load() {
        //url where the JSON file is located
        let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json")!
        do {
                    let dataUrl =
                        try Data(contentsOf: url)
            
                    let jsonDecoder = JSONDecoder()
                    let urlDataFromJson =
            
            try jsonDecoder.decode(Feed.self, from: dataUrl)
            self.albums = urlDataFromJson.feed.results
            MyVariables.copyright = urlDataFromJson.feed.copyright
                    
                } catch {
                    print(error)
                }
    }
}
