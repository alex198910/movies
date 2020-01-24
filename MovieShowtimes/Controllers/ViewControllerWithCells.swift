//
//  ViewControllerWithCells.swift
//  MovieShowtimes
//
//  Created by admin on 30.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerWithCells: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewControllerDelegate {
        
    var arrayOfMovies = [Movie]()
    private var names = [String: UIColor]()
    private var pushes = [String: Int]()
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
    
    
    func changeDataAfterPush(name: String) {
        self.names[name] = UIColor(red: 0.2, green: 0.1, blue: 0.3, alpha: 0.2)
        self.pushes[name] = (self.pushes[name] ?? 0) + 1
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.reloadData()
        self.view.addSubview(self.tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countOfMembers = arrayOfMovies.count
        return countOfMembers
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let jsonDataNew = arrayOfMovies[indexPath.row]
        cell.mainImageView.image = UIImage(named: jsonDataNew.poster ?? "no_image.png")
        cell.mainLabel.text = jsonDataNew.name
        cell.secondLabel.text = jsonDataNew.time
        return cell
        
    }
    
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerPush = storyboard?.instantiateViewController(identifier: "ViewControllerPush") as! ViewControllerPush
        let jsonDataNew = arrayOfMovies[indexPath.row]
        viewControllerPush.movieText = jsonDataNew.name
        viewControllerPush.timeText = jsonDataNew.time
        viewControllerPush.posterImage = UIImage(named: jsonDataNew.poster ?? "no_image.png")
        viewControllerPush.colorOfBackground = names[jsonDataNew.name ?? ""] ?? UIColor.white
        viewControllerPush.delegate = self as TableViewControllerDelegate
        viewControllerPush.indexCurrentSession = pushes[jsonDataNew.name ?? ""] ?? 0
        self.navigationController?.pushViewController(viewControllerPush, animated: true)
        
    }

}
