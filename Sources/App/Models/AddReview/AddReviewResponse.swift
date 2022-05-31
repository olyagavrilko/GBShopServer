//
//  AddReviewResponse.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

struct AddReviewResponse: Content {
    let result: Int
    let message: String
}
