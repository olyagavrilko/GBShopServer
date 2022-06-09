//
//  Database.swift
//  
//
//  Created by Olya Ganeva on 08.06.2022.
//

import Foundation

final class Database {
    
    static let shared = Database()
    
    var catalog = Catalog()
    var cart = Cart()
    var wallet = Wallet()
    
    private init() { }
}

final class Catalog {
    
    let products: [Product] = [
        Product(productID: 123, name: "Ноутбук", price: 45600),
        Product(productID: 456, name: "Мышка", price: 1000)
    ]
}

final class Cart {
    
    var items: [(product: Product, count: Int)] = []
    
    var totalPrice: Int {
        items.reduce(0) { sum, item in
            sum + item.product.price * item.count
        }
    }
}

final class Wallet {
    
    var balance = 500000
}
