//
//  MessageCell.swift
//  AppChatSimple
//
//  Created by Nguyen Duy anh on 3/8/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var massageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        massageBubble.layer.cornerRadius = massageBubble.frame.size.height / 7.1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
