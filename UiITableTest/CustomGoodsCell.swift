//
//  CustomGoodsCell.swift
//  UiITableTest
//
//  Created by Eugene Krapivenko on 17.03.2022.
//

import UIKit

class CustomGoodsCell: UITableViewCell {

    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var goodPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
