//
//  RemoveReviewRequest.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

struct RemoveReviewRequest: Content {
    let reviewID: Int
}
