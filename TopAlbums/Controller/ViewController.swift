//
//  ViewController.swift
//  TopAlbums
//
//  Created by Miladin Kovacevic on 1/17/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var albumsTableView = UITableView()
    var albums: [Album] = [Album]()
    var images: [UIImage] = [UIImage]()
    
    let urlData = DataLoader().albums
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Albums"
        
        albumsTableView.backgroundColor = .white
        self.albumsTableView.rowHeight = 50
        
        albumsTableView.dataSource = self
        albumsTableView.delegate = self
        
        albumsTableView.register(AlbumCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(albumsTableView)
        
        albums = urlData
        
    }
    
    override func viewDidLayoutSubviews() {
        albumsTableView.translatesAutoresizingMaskIntoConstraints = false
        albumsTableView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        albumsTableView.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        albumsTableView.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        albumsTableView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumCell
        
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        let curr = albums[indexPath.row]
        
        if let url = URL(string: curr.artworkUrl100) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    MyVariables.image = UIImage(data: data)!
                    self.images.append(UIImage(data: data)!)
                    cell.album = curr
                }
            }
            
        }
            dataTask.resume()
        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailedViewController()
        vc.album = albums[indexPath.row]
        vc.image = images[indexPath.row]
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
}

