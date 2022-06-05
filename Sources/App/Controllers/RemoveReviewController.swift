//
//  RemoveReviewController.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

class RemoveReviewController {
    
    func removeReview(_ req: Request) throws -> EventLoopFuture<RemoveReviewResponse> {
        
        guard let body = try? req.query.decode(RemoveReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = RemoveReviewResponse(result: 1)
        
        return req.eventLoop.future(response)
    }
}
