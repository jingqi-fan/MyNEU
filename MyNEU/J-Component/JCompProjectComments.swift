//
//  JCompProjectComments.swift
//  Envit
//
//  Created by Likhit Garimella on 29/06/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class JCompProjectComments {
    
    var commentText: String?
    var uid: String?
    
}

extension JCompProjectComments {
    
    static func transformComment(dict: [String: Any]) -> JCompProjectComments {
        
        let comment = JCompProjectComments()
        comment.commentText = dict["commentText"] as? String
        comment.uid = dict["uid"] as? String
        return comment
        
    }
    
}   // #30
