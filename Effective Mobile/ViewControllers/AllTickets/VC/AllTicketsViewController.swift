//
//  AllTicketsViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 06.06.2024.
//

import UIKit

class AllTicketsViewController: UIViewController {
    
    //MARK: - objects
    private var viewModel: AllTicketsViewModelProtocol!

    convenience init(viewModel: AllTicketsViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    


}

//MARK: - Layout
extension AllTicketsViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupLayoutForChildViews() {
        
    }
}
