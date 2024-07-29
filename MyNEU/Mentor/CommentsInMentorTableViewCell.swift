//
//  CommentsInMentorTableViewCell.swift
//  Envit
//
//  Created by Likhit Garimella on 16/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class CommentsInMentorTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    var mentorComment: MentorComments? {
        didSet {
            updateView()
        }
    }
    
    /// when this user property is set..
    /// we'll let the cell download the correspoding cell..
    var user: AppUser? {
        didSet {
            setupUserInfo()
        }
    }
    
    func updateView() {
        
        commentLabel.text = mentorComment?.commentText
        setupUserInfo()
        
    }
    
    /// New setupUserInfo() func
    func setupUserInfo() {
        
        nameLabel.text = user?.nameString
        
    }

    /// This is only called when a cell is loaded in a memory...
    /// It's not called when a cell is reused later...
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.text = ""
        commentLabel.text = ""
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }

}   // #62