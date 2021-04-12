//
//  Message.swift
//  ch16-CustView
//
//  Created by admin on 2020/06/03.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

// Message.swift
class Message{
    var avata: String?
    var sender: String
    var message: String
    
    init(sender: String, message:String, avata: String?){
        self.message = message
        self.sender = sender
        self.avata = avata
    }
}
