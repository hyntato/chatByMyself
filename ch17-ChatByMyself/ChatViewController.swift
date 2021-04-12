//
//  ChatViewController.swift
//  ch17-ChatByMyself
//
//  Created by admin on 2020/06/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var tableViewButtomConstraint: NSLayoutConstraint!
    
    var offset: CGFloat?
    var messageStore = MessageStore()
    var me = "hyeyeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.delegate = self
        chatTableView.dataSource = self
        messageStore.delegate = self
        chatTextView.delegate = self
    }

    @IBAction func onSendButtonClicked(_ sender: UIButton) {
        
        if let text = chatTextView.text, !text.isEmpty {
            let message = Message(sender: me, message: text, avata: "female.jpg")
            chatTextView.text = ""
            messageStore.addMessage(message: message)
        }
        
        chatTextView.resignFirstResponder()
    }

    @IBAction func onLogoutButtonClicked(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)  // up to welcome (rootview)
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageStore.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MessageViewCell")
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "MessageViewCell") as! MessageViewCell
        let message = messageStore.messages[indexPath.row]
        cell.updateMessageCell(message: message, isMe: (me == message.sender))
        return cell
    }
    
}

extension ChatViewController: MessageStoreDelegate {
    
    func onChangeMessageStore(message: Message, action: MessageAction) {
        chatTableView.reloadData()
    }
    
}

extension ChatViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        offset = tableViewButtomConstraint.constant  // 60
        tableViewButtomConstraint.constant = 370  // keybord height
        
        view.layoutIfNeeded()  // redraw??
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let offset = offset {
            tableViewButtomConstraint.constant = offset
        }
    }
}
