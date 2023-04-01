//
//  HomeDetailViewModel.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import Foundation
import RxCocoa
import RxSwift
protocol HomeDetailViewModelInput {
    var ProductDetail: PublishSubject<Product> {get set}
    func viewDidLoad()
}

class HomeDetailViewModel: BaseViewModel, HomeDetailViewModelInput {
    
    var product: Product
    var ProductDetail: PublishSubject<Product> = .init()
    init(product:Product) {
        self.product = product
    }
    
    func viewDidLoad() {
        ProductDetail.onNext(product)

    }
}
