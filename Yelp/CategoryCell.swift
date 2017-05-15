//
//  CategoryCell.swift
//  Yelp
//
//  Created by Hun Tun Zaw on 5/10/17.
//  Copyright © 2017 Brandon Nguyen, Clarence Wu, Hun Tun Zaw. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    @objc optional func switchCell(switchCell: CategoryCell, didChangeValue value: Bool)
}

class CategoryCell: UITableViewCell {

    
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    weak var delegate: SwitchCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onOffSwitch.addTarget(self, action: #selector(CategoryCell.switchValueChanged), for: UIControlEvents.valueChanged)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged() {
        delegate?.switchCell?(switchCell: self, didChangeValue: onOffSwitch.isOn)
    }

}
