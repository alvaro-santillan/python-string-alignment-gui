//
//  HelpScreenTableViewCell.swift
//  Sort N Search
//
//  Created by Álvaro Santillan on 3/16/21.
//  Copyright © 2021 Álvaro Santillan. All rights reserved.
//

import UIKit

class HelpScreenTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var guaranteedIconSquare: UIImageView!
    @IBOutlet weak var optimalIconSquare: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
