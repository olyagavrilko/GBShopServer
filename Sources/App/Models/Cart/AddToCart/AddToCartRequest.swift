//
//  AddToCartRequest.swift
//  
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Vapor

struct AddToCartRequest: Content {
    let productID: Int
    let quantity: Int
}
