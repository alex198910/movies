//
//  TableViewCell.swift
//  MovieShowtimes
//
//  Created by admin on 18.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

    

class TableViewCell: UITableViewCell {


    var i = 0
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
