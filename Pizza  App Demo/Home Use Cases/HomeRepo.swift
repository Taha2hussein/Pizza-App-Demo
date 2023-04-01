//
//  HomeRepo.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import Foundation
import RxSwift
protocol HomeRepositry {
    func fetchSliderData() -> Observable<[Slider]>
    func fetchPopularPizza()-> Observable<[Product]>
}

class HomeRepo: HomeRepositry {
   
    
    let network: NetworkClient
    init(network: NetworkClient = NetworkClient()){
        self.network = network
    }
    func fetchSliderData() -> Observable<[Slider]> {
        Observable<[Slider]>.create { [weak self] (item) -> Disposable in
            self?.network.performRequest([Slider].self, router: MainRouter.slider) { result in
                switch result {
                case .success(let data):
                    item.onNext(data.data)
                    item.onCompleted()
                case .failure(let fail):
                    item.onError(fail)
                }
            }
            return Disposables.create()
        }
    }
    
    func fetchPopularPizza() -> Observable<[Product]> {
        Observable<[Product]>.create { [weak self] (item) -> Disposable in
            self?.network.performRequest([Product].self, router: FeedRouter.popular) { result in
                switch result {
                case .success(let data):
                    item.onNext(data.data)
                    item.onCompleted()
                case .failure(let fail):
                    item.onError(fail)
                }
            }
            return Disposables.create()
        }
    }
    
}
