//
//  HomeViewModel.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import Foundation
import RxSwift
import RxRelay

protocol HomeViewModelInput {
    func viewDidLoad()
    func disSelectProduct(_ indexPath: IndexPath)
}
 
protocol HomeViewModelOutput {
    var navigateToNextView : PublishSubject<Product> {get set}
}

class HomeViewModel:BaseViewModel, HomeViewModelInput , HomeViewModelOutput {
    var navigateToNextView: PublishSubject<Product> = .init()
    private var slidersObservable = PublishSubject<[Slider]>.init()
    private var popularObservable = PublishSubject<[Product]>.init()
    var popularData = [Product]()
    var popular: Observable<[Product]> {
        return popularObservable
    }
    
    var sliders: Observable<[Slider]> {
        return slidersObservable
    }
    
    let homeUseCase: HomeUseCase
    let disposeBag = DisposeBag()
    init(homeUseCase: HomeUseCase){
        self.homeUseCase = homeUseCase
    }
    
    func viewDidLoad() {
        fetchSlider()
        fetchPopular()
    }
    
    func fetchPopular() {
        self.isLoading.onNext(true)
        homeUseCase.fetchPopular().subscribe {[weak self] item in
            self?.isLoading.onNext(false)
            self?.popularObservable.onNext(item)
            self?.popularData = item
        } onError: { _ in
            self.isLoading.onNext(false)
        } onCompleted: {
            self.isLoading.onNext(false)
        }.disposed(by: self.disposeBag)

    }
    
    func fetchSlider() {
        self.isLoading.onNext(false)
        homeUseCase.fetchSlider().subscribe {[weak self] sliders in
            self?.isLoading.onNext(false)
            self?.slidersObservable.onNext(sliders)
        } onError: { _ in
            self.isLoading.onNext(false)
        } onCompleted: {
            self.isLoading.onNext(false)
        } .disposed(by: self.disposeBag)

    }
    
    func disSelectProduct(_ indexPath: IndexPath) {
        navigateToNextView.onNext(popularData[indexPath.row])
    }
}
