//
//  SliderCell.swift
//  PizzaWorld
//
//  Created by Osama on 10/14/20.
//

import UIKit

class SliderCell: UICollectionViewCell {

    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var orderNowButton: UIButton!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ viewModel: Slider){
        self.titleLabel.text = viewModel.buttonTitle
        self.orderNowButton.setTitle(viewModel.buttonTitle, for: .normal)
        self.categoryLabel.text = viewModel.product.category
        self.cookTimeLabel.text = viewModel.product.cookTime
        
        ratingView.configureWithRating(rating: viewModel.product.rating)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ratingView.stackView.removeAllArrangedSubviews()
    }

}
