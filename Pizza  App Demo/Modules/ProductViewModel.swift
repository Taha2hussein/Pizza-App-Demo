//
//  ProductViewModel.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import Foundation
class ProductViewModel {
    let mainTitle: String
    let rating: Int
    init(produt: Product) {
        mainTitle = produt.title
        rating = produt.rating
    }
}
