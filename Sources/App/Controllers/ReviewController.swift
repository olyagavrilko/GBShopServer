//
//  ReviewController.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

class ReviewController {
    
    func addReview(_ req: Request) throws -> EventLoopFuture<AddReviewResponse> {
        
        guard let body = try? req.content.decode(AddReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = AddReviewResponse(result: 1, message: "Ваш отзыв был передан на модерацию.")
        
        return req.eventLoop.future(response)
    }
    
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
    
    func deleteReview(_ req: Request) throws -> EventLoopFuture<RemoveReviewResponse> {
        
        guard let body = try? req.query.decode(RemoveReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = RemoveReviewResponse(result: 1)
        
        return req.eventLoop.future(response)
    }
}
