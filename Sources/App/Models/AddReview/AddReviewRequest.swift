//
//  AddReviewRequest.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

struct AddReviewRequest: Content {
    let userID: Int
    let text: String
}
