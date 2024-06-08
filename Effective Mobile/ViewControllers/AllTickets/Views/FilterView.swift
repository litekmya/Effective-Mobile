//
//  FilterView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import UIKit

class FilterView: UIView {
    
    let filterBtn: UIButton = {
        let btn = UIButton()
        btn.setupImageAndTitle(imageName: "filter", title: "Фильтр", tint: .white, font: .installSFMedium(fontSize: 14))
        return btn
    }()
    
    let chartBtn: UIButton = {
        let btn = UIButton()
        btn.setupImageAndTitle(imageName: "chart", title: "График цен", tint: .white, font: .installSFRegular(fontSize: 14))
        return btn
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
extension FilterView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 18
        backgroundColor = .newBlue
    }
    
    private func setupLayoutForChildViews() {
        addSubview(filterBtn)
        filterBtn.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(10)
            make.centerY.equalTo(self)
        }
        
        addSubview(chartBtn)
        chartBtn.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(10)
            make.centerY.equalTo(self)
        }
    }
}
