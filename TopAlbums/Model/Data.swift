//
//  Data.swift
//  TopAlbums
//
//  Created by Miladin Kovacevic on 1/17/22.
//

import Foundation
import UIKit

struct Feed: Codable {
    let feed: Initial
}

struct Initial: Codable {
    let title: String
    let id: String
    let author: Author
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Album]
}

struct Link: Codable {
    let s: String
}
struct Author: Codable {
    let name: String
    let url: String
}

struct Album: Codable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: String
    let kind: String
    let artistId: String?
    let artistUrl: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
}

struct MyVariables {
    static var image = UIImage()
    static var copyright = String()
}

struct Genre: Codable {
    let genreId: String
    let name: String
    let url: String
}
