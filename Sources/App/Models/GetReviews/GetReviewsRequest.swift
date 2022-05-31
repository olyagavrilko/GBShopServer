//
//  GetReviewsRequest.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

struct GetReviewsRequest: Content {
    let productID: Int
}
