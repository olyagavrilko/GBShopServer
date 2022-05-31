//
//  GetReviewsController.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

class GetReviewsController {
    
    func getReviews(_ req: Request) throws -> EventLoopFuture<GetReviewsResponse> {
        
        guard let body = try? req.query.decode(GetReviewsRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = GetReviewsResponse(
            result: 1,
            reviews: [Review(text: "qwerty"),
                      Review(text: "qwerty1")
                     ]
        )
        
        return req.eventLoop.future(response)
    }
}
