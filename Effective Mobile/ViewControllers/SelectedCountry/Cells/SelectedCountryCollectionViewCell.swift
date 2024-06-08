//
//  SelectedCountryCollectionViewCell.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class SelectedCountryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SelectedCountryCollectionViewCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .grey7
        return view
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .white, text: "")
        return lbl
    }()
    
    let daylbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .grey6, text: "")
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout
extension SelectedCountryCollectionViewCell {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = .grey2
    }
    
    private func setupLayoutForChildViews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(10)
            make.centerY.equalTo(self)
            make.height.width.equalTo(16)
        }
        
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.centerY.equalTo(self)
        }
        
        addSubview(daylbl)
        daylbl.snp.makeConstraints { make in
            make.leading.equalTo(titleLbl.snp.trailing)
            make.centerY.equalTo(self)
        }
    }
}
