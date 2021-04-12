//
//  MessageViewCell.swift
//  ch16-CustView
//
//  Created by admin on 2020/06/03.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MessageViewCell: UITableViewCell {
    
    @IBOutlet weak var messageView: MessageView!
    
    
    func updateMessageCell(message: Message, isMe: Bool){
        
        let lc = messageView.messageViewLeadingConstraint
        let tc = messageView.messageViewTrailingConstraint
        
        messageView.senderLabel.text = message.sender
        messageView.messageLabel.text = message.message
        messageView.leftImageView.image = UIImage(named: message.avata!)
        messageView.rightImageView.image = UIImage(named: message.avata!)
        
        if isMe == true {
            
            if lc != nil, tc != nil {
                lc?.isActive = false
                tc?.isActive = true
            }
            
            messageView.senderLabel.textAlignment = .right
            messageView.messageLabel.textAlignment = .right
            messageView.rightImageView.isHidden = false
            messageView.leftImageView.isHidden = true
        }
        else{
            
            if lc != nil, tc != nil {
                lc?.isActive = true
                tc?.isActive = false
            }
            
            messageView.senderLabel.textAlignment = .left
            messageView.messageLabel.textAlignment = .left
            messageView.leftImageView.isHidden = false
            messageView.rightImageView.isHidden = true
        }
    }
    
}
