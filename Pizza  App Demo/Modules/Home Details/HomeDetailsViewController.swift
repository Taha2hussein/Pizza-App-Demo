//
//  HomeDetailsViewController.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import UIKit

class HomeDetailsViewController: BaseWireframe<HomeDetailViewModel> {
    @IBOutlet weak var pizzaLabel: UILabel!
    
    @IBOutlet weak var pizzaIngrients: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var descTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    override func bind(viewModel: HomeDetailViewModel) {
//        viewModel.ProductDetail.subscribe {[weak self] product in
           
//        }.disposed(by: disposeBag)
        
        viewModel.ProductDetail.subscribe {[weak self] Product in
            guard let product = Product.element else{return}
            print(Product.element , "Products")
            self?.setupProductView(with: product)
           
        } .disposed(by: disposeBag)

    }

    private func setupProductView(with viewModel: Product){
        pizzaLabel.text = viewModel.title
        ratingView.configureWithRating(rating: viewModel.rating)
    }
}
