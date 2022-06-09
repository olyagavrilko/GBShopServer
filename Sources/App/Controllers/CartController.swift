//
//  CartController.swift
//  
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Vapor

class CartController {
    
    func addToBasket(_ req: Request) throws -> EventLoopFuture<AddToCartResponse> {
        
        guard let body = try? req.content.decode(AddToCartRequest.self) else {
            throw Abort(.badRequest)
        }
        
        guard let product = Database.shared.catalog.products.first(
            where: { $0.productID == body.productID }
        ) else {
            throw Abort(.badRequest)
        }
        
        if let index = Database.shared.cart.items.firstIndex(
            where: { $0.product.productID == product.productID }
        ) {
            Database.shared.cart.items[index].count += body.quantity
        } else {
            Database.shared.cart.items.append((product: product, count: body.quantity))
        }
        
        let response = AddToCartResponse(result: 1)
        return req.eventLoop.future(response)
    }
    
    func deleteFromBasket(_ req: Request) throws -> EventLoopFuture<DeleteFromCartResponse> {
        
        guard let body = try? req.query.decode(DeleteFromCartRequest.self) else {
            throw Abort(.badRequest)
        }
        
        guard let productIndex = Database.shared.catalog.products.firstIndex(
            where: { $0.productID == body.productID }
        ) else {
            throw Abort(.badRequest)
        }
        
        Database.shared.cart.items.remove(at: productIndex)
        
        let response = DeleteFromCartResponse(result: 1)
        return req.eventLoop.future(response)
    }
    
    func buy(_ req: Request) throws -> EventLoopFuture<MakePurchaseResponse> {
        
        guard let body = try? req.query.decode(MakePurchaseRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let totalPrice = Database.shared.cart.totalPrice
        guard totalPrice <= Database.shared.wallet.balance else {
            throw Abort(.badRequest)
        }
        
        Database.shared.wallet.balance -= totalPrice
        Database.shared.cart.items.removeAll()
        
        print("Баланс после покупки", Database.shared.wallet.balance)
        
        let response = MakePurchaseResponse(result: 1)
        return req.eventLoop.future(response)
    }
}
