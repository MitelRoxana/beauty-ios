//
//  GoogleCalendarManager.swift
//  Beauty
//
//  Created by Roxana Mitel on 23/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import GoogleAPIClientForREST
import GoogleSignIn

class GoogleCalendarManager {
    static let sharedInstance = GoogleCalendarManager()
    var service = GTLRCalendarService()
    var scopes = [String]()
    
    init() {
        scopes = [kGTLRAuthScopeCalendar, kGTLRAuthScopeCalendarReadonly]
    }
    
    func isLoggedIn() -> Bool {
        return GIDSignIn.sharedInstance().hasAuthInKeychain()
    }
}



