//
//  CatalogResponse.swift
//  
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Vapor

struct CatalogResponse: Content {
    let products: [Product]
}

struct Product: Content {
    let productID: Int
    let name: String
    let price: Int
}
