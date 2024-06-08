//
//  HelpCollectionViewCell.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class HelpCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HelpCollectionViewCell"
    
    let imageView = UIImageView()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .white, text: "text")
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
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
extension HelpCollectionViewCell {
    
    private func setupUI() {
        setupLayoutForChildViews()
    }
    
    private func setupLayoutForChildViews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.top.equalTo(self)
            make.width.height.equalTo(48)
        }
        
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(self)
        }
    }
}
