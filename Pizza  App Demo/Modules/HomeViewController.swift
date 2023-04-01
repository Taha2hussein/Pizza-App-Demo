//
//  HomeViewController.swift
//  Pizza  App Demo
//
//  Created by A on 01/04/2023.
//

import UIKit

class HomeViewController: BaseWireframe<HomeViewModel> {

    @IBOutlet weak var pizzaTableView: UITableView!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        registerCells()
        bindSliderCollection()
        sliderCollectionView.rx.setDelegate(self).disposed(by: self.disposeBag)
    }

    override func bind(viewModel: HomeViewModel) {
        viewModel.popular.bind(to: pizzaTableView.rx.items(cellIdentifier: String(describing: PopularCell.self), cellType: PopularCell.self)) {
           (index , model, cell) in
            cell.ratingView.rating = model.rating
            cell.productTitle.text = model.title
        }.disposed(by: self.disposeBag)
    }
    
    func bindSliderCollection() {
        viewModel.sliders.bind(to: sliderCollectionView.rx.items(cellIdentifier: String(describing: SliderCell.self), cellType: SliderCell.self)) { (index, model, cell) in
            cell.configure(model)
        }.disposed(by: self.disposeBag)
    }
    
    
    func registerCells() {
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
        pizzaTableView.registerCellNib(cellClass: PopularCell.self)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
        }
}
