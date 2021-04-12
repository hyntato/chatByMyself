//
//  MessageStore.swift
//  ch17-ChatByMyself
//
//  Created by admin on 2020/06/10.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum MessageAction {
    case add
    case remove
    case modify
}

protocol MessageStoreDelegate {
    func onChangeMessageStore(message: Message, action: MessageAction)
}

class MessageStore {
    var messages: [Message]
    var delegate: MessageStoreDelegate?
    
    init() {
        messages = []
    }
    
    func addMessage(message: Message) {
        messages.append(message)
        if let delegate = delegate {
            delegate.onChangeMessageStore(message: message, action: .add)
        }
    }
    
    func deleteMessage(index: Int) {
        let message = messages[index]
        messages.remove(at: index)
        if let delegate = delegate {
            delegate.onChangeMessageStore(message: message, action: .remove)
        }
    }
    
    func changeMessage(message: Message, index: Int) {
        let oldMessage = messages[index]
        messages[index] = message
        if let delegate = delegate {
            delegate.onChangeMessageStore(message: oldMessage, action: .modify)
        }
    }
    
}
