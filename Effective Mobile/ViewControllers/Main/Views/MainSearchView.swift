//
//  MainSearchView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class MainSearchView: UIView {
    
    let searchView: SearchView = {
        let view = SearchView()
        view.isTwoObjects = false
        return view
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout
extension MainSearchView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = .grey2
    }
    
    private func setupLayoutForChildViews() {
        addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
    }
}
