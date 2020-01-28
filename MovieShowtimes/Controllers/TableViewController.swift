//
//  ViewControllerWithCells.swift
//  MovieShowtimes
//
//  Created by admin on 30.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var movies: [Movie] = []
    let tableView = UITableView.init(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 200
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let dataForCell = movies[indexPath.row]
        cell.mainImageView.image = UIImage(named: dataForCell.poster ?? "no_image.png")
        cell.mainLabel.text = dataForCell.name
        cell.secondLabel.text = dataForCell.time
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewControllerPush = storyboard?.instantiateViewController(identifier: "ViewControllerPush") as? TailViewController else { return }
        
        let movie = movies[indexPath.row]
        viewControllerPush.movieName = movie.name
        viewControllerPush.timeText = movie.time
        viewControllerPush.posterImage = UIImage(named: movie.poster ?? "no_image.png")

        self.navigationController?.pushViewController(viewControllerPush, animated: true)
    }
}
