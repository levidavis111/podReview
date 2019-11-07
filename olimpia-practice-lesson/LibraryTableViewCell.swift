//
//  LibraryTableViewCell.swift
//  olimpia-practice-lesson
//
//  Created by Levi Davis on 11/7/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class LibraryTableViewCell: MGSwipeTableCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
