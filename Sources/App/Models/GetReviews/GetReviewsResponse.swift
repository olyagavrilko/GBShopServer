//
//  GetReviewsResponse.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

struct GetReviewsResponse: Content {
    let result: Int
    let reviews: [Review]
}

struct Review: Content {
    let text: String
}
