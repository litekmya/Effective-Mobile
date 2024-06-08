//
//  FlyAwayCollectionViewCell.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class FlyAwayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FlyAwayCollectionViewCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFMedium(fontSize: 16), color: .white, text: "name")
        return lbl
    }()
    
    let cityLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .white, text: "city")
        return lbl
    }()
    
    let costLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .white, text: "от 22 264 ₽")
        return lbl
    }()
    
    private let airplaneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "airplane")
        view.tintColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1)
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
extension FlyAwayCollectionViewCell {
    
    private func setupUI() {
        setupLayoutForChildViews()
    }
    
    private func setupLayoutForChildViews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.top.equalTo(self)
            make.width.height.equalTo(133)
        }
        
        addSubview(nameLbl)
        nameLbl.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
        
        addSubview(cityLbl)
        cityLbl.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.top.equalTo(nameLbl.snp.bottom).offset(8)
        }
        
        addSubview(airplaneImageView)
        airplaneImageView.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.top.equalTo(cityLbl.snp.bottom).offset(4)
            make.width.height.equalTo(20)
        }
        
        addSubview(costLbl)
        costLbl.snp.makeConstraints { make in
            make.leading.equalTo(airplaneImageView.snp.trailing).offset(4)
            make.centerY.equalTo(airplaneImageView)
            make.trailing.equalTo(self)
        }
    }
}
