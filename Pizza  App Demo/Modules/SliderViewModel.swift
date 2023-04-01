//
//  SliderViewModel.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import Foundation
class SliderViewModel {
    var title: String
    var buttonTitle: String
    var rating: Int
    var category: String
    var cookTime: String

    init(_ slider: Slider) {
        self.buttonTitle = slider.buttonTitle
        self.title = slider.product.title
        self.rating = slider.product.rating
        self.category = slider.product.category
        self.cookTime = slider.product.cookTime
    }
}
