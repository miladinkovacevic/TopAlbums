//
//  AlbumCell.swift
//  TopAlbums
//
//  Created by Miladin Kovacevic on 1/17/22.
//

import UIKit
class AlbumCell : UITableViewCell {
    
    var album : Album? {
        didSet {
            //albumImage.image = UIImage(named: "star.png")
            albumImage.image = MyVariables.image
            albumNameLabel.text = album?.name
            artistNameLabel.text = album?.artistName
        }
    }
    
    // Definition of subviews for a tebleview cell
    private let albumNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.fontAndAlignment(size: 12, alignment: .left)
        return lbl
    }()
    
    private let artistNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.fontAndAlignment(size: 8, alignment: .left)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let albumImage : UIImageView = {
        let imgView = UIImageView(image: MyVariables.image)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.frame.size.width = 50
        imgView.frame.size.height = 50
        return imgView
    }()
    
    // Init subviews in cell and organize constraints
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(albumImage)
        addSubview(albumNameLabel)
        addSubview(artistNameLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        albumNameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 60).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor ).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -10).isActive = true
        
        artistNameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 60).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 5).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
