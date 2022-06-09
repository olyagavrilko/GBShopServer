//
//  CatalogRequest.swift
//  
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Vapor

struct CatalogRequest: Content {
    let pageNumber: Int
    let categoryID: Int
}
