//
//  MessageView.swift
//  ch16-CustView
//
//  Created by admin on 2020/06/03.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

// MessageView.swift
class MessageView: UIView {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageViewTrailingConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize(){
        let className = NSStringFromClass(self.classForCoder) // ch16-CustomView.MessageView
        guard let xibName = className.components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // to do something for initialization
    }
}


@IBDesignable
class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 16.0
    @IBInspectable var rightInset: CGFloat = 16.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
}
