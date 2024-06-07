//
//  SearchViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let topLine: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.backgroundColor = .grey5
        return view
    }()

    //MARK: - objects
    private var viewModel: SearchViewModelProtocol!
    
    //MARK: - Lifecycle
    convenience init(viewModel: SearchViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

}

//MARK: - Layout
extension SearchViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 41/255, alpha: 1)
    }
    
    private func setupLayoutForChildViews() {
        
    }
}
