//
//  DeleteFromCartRequest.swift
//  
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Vapor

struct DeleteFromCartRequest: Content {
    let productID: Int
}
