//
//  AddReviewController.swift
//  
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Vapor

class AddReviewController {
    
    func addReview(_ req: Request) throws -> EventLoopFuture<AddReviewResponse> {
        
        guard let body = try? req.content.decode(AddReviewRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = AddReviewResponse(result: 1, message: "Ваш отзыв был передан на модерацию.")
        
        return req.eventLoop.future(response)
    }
}
