//
//  LogoutRequest.swift
//  
//
//  Created by Olya Ganeva on 27.05.2022.
//

import Vapor

struct LogoutRequest: Content {
    let userID: Int
}
