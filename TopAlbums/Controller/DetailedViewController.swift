//
//  DetailedViewController.swift
//  TopAlbums
//
//  Created by Miladin Kovacevic on 1/18/22.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var album: Album!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Album"
        // Image view for Album Image
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 60, y: 120, width: view.frame.width - 120, height: view.frame.width - 120)
        
        view.addSubview(imageView)
        
        // Album Name
        let albumName = UILabel(frame: CGRect(x: 20, y: imageView.frame.maxY + 5, width:view.frame.width - 40, height: 21))
        albumName.fontAndAlignment(size: 12, alignment: .center)
        albumName.text = album.name
        
        self.view.addSubview(albumName)
        
        // Artist Name
        let artistName = UILabel(frame: CGRect(x: 0, y: albumName.frame.maxY, width:view.frame.width, height: 21))
        artistName.fontAndAlignment(size: 8, alignment: .center)
        artistName.text = album.artistName
        
        self.view.addSubview(artistName)
        
        // List of genres for currently open album
        let genre = UILabel(frame: CGRect(x: 0, y: artistName.frame.maxY + 5, width:view.frame.width, height: 21))
        genre.fontAndAlignment(size: 12, alignment: .center)
        genre.numberOfLines = 0
        
        var genres: String = ""
        
        for i in album.genres {
            genres.append(i.name + " ")
        }
        genre.text = genres
        
        self.view.addSubview(genre)
        
        // Album release Date
        let releaseDate = UILabel(frame: CGRect(x: 0, y: genre.frame.maxY, width:view.frame.width, height: 21))
        releaseDate.fontAndAlignment(size: 10, alignment: .center)
        releaseDate.text = album.releaseDate
        
        self.view.addSubview(releaseDate)
        
        
        // Copyrights label from static address - because it is constant
        let copyrights = UILabel(frame: CGRect(x: 0, y: releaseDate.frame.maxY, width:view.frame.width, height: 21))
        copyrights.font = UIFont.systemFont(ofSize: 8)
        copyrights.textAlignment = .center
        copyrights.text = MyVariables.copyright
        
        self.view.addSubview(copyrights)
        
        // Visit Store button for url call
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.maxY - 80, width: view.frame.width - 40, height: 60))
        button.backgroundColor = .orange
        button.setTitle("Visit Store", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchDown)
        
    }
    
    // @objc functions.cen
    @objc func buttonAction(_ sender:UIButton!) {
        if let url = URL(string: album.url) {
            UIApplication.shared.open(url)
        }
    }
    
    
    
    
    
}
