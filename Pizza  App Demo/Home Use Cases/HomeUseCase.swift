//
//  HomeUseCase.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import Foundation
import RxSwift
class HomeUseCase {
    let disposBag = DisposeBag()
    let homeRepo: HomeRepositry
    init(homeRepo:HomeRepositry) {
        self.homeRepo = homeRepo
    }
    
    func fetchPopular()-> Observable<[Product]> {
        let observable = homeRepo.fetchPopularPizza()
        observable.subscribe {  (item) in
            
        }.disposed(by: self.disposBag)
        return observable
    }
    
    func fetchSlider()-> Observable<[Slider]> {
        let observable = homeRepo.fetchSliderData()
        observable.subscribe { (slider) in
            
        } .disposed(by: self.disposBag)
        return observable

    }
}
