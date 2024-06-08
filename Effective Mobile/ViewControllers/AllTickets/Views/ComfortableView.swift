//
//  ComfortableView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import UIKit

class ComfortableView: UIView {
    
    private let lbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .white, text: "Самый удобный")
        return lbl
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
extension ComfortableView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        backgroundColor = .newBlue
    }
    
    private func setupLayoutForChildViews() {
        addSubview(lbl)
        lbl.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
}
