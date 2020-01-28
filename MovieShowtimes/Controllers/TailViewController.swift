//
//  ViewController6.swift
//  MovieShowtimes
//
//  Created by admin on 19.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class TailViewController: UIViewController {
        
    @IBOutlet weak var scrollScrollView: UIScrollView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movieName: String?
    var timeText: String?
    var posterImage: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieNameLabel.text = movieName
        posterImageView.image = posterImage
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.sizeToFit()
        timeLabel.text = (timeText?.replacingOccurrences(of: " ", with: "\n\n\n")) ?? ""
        scrollScrollView.addSubview(timeLabel)
    }
}
