//
//  Constants.swift
//  AppChatSimple
//
//  Created by Nguyen Duy anh on 3/8/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import Foundation


struct Constants {
    static let appName = "AppChatSimple💬"
    static let registerSegue = "registerToChat"
    static let loginSegue = "loginToChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    
    struct textColor {
        static let lightPurple = "BrandLightPurple"
        static let cyanBlue = "CyanBlue"
    }
    
    
    struct FStore {
        static let collectionName = "Message"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
