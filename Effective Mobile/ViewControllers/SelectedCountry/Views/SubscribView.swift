//
//  SubscribView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 06.06.2024.
//

import UIKit

class SubscribView: UIView {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bell.fill")
        view.tintColor = .newBlue
        return view
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFMedium(fontSize: 16), color: .white, text: "Подписка на цену")
        return lbl
    }()
    
    private let switcher = UISwitch()
    
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
extension SubscribView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 41/255, alpha: 1) 
    }
    
    private func setupLayoutForChildViews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.centerY.equalTo(self)
            make.width.equalTo(22)
            make.height.equalTo(24)
        }
        
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.centerY.equalTo(self)
        }
        
        addSubview(switcher)
        switcher.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(16)
            make.centerY.equalTo(self)
        }
    }
}
