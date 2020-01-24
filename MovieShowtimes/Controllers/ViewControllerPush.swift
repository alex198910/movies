//
//  ViewController6.swift
//  MovieShowtimes
//
//  Created by admin on 19.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate {
    func changeDataAfterPush(name: String)
}


class ViewControllerPush: UIViewController {
    
    var delegate: TableViewControllerDelegate?
    
    @IBOutlet weak var scrollScrollView: UIScrollView!
    
    @IBOutlet weak var SaveUIButton: UIButton!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movieText: String?
    var timeText: String?
    var posterImage: UIImage?
    var colorOfBackground: UIColor?
    var index: Int?
    var indexCurrentSession: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieNameLabel.backgroundColor = colorOfBackground ?? UIColor.white
        scrollScrollView.backgroundColor = colorOfBackground ?? UIColor.white
        movieNameLabel.text = movieText
        posterImageView.image = posterImage
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.sizeToFit()
        movieNameLabel.sizeToFit()
        timeLabel.text = (timeText?.replacingOccurrences(of: " ", with: "\n\n\n")) ?? ""
        timeLabel.text = (timeLabel.text ?? "") + "\n\n\n Вы посещали эту страницу в этой сессии \(indexCurrentSession ?? 0) раз\n "
        scrollScrollView.addSubview(timeLabel)
        scrollScrollView.contentSize = timeLabel.intrinsicContentSize
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.changeDataAfterPush(name: movieText ?? "")
        
    }

}
