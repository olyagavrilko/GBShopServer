//
//  CatalogController.swift
//  
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Vapor

class CatalogController {
    
    func getProductList(_ req: Request) throws -> (EventLoopFuture<CatalogResponse>) {
        
        guard let body = try? req.query.decode(CatalogRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = CatalogResponse(products: Database.shared.catalog.products)
        return req.eventLoop.future(response)
    }
}
