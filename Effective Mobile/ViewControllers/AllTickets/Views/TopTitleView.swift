//
//  TopTitleView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import UIKit

class TopTitleView: UIView {
    
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .newBlue
        return btn
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFMedium(fontSize: 16), color: .white, text: "")
        return lbl
    }()
    
    let descripLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFMedium(fontSize: 14), color: .grey6, text: "")
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
extension TopTitleView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 41/255, alpha: 1)
    }
    
    private func setupLayoutForChildViews() {
        addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.centerY.equalTo(self)
            make.width.height.equalTo(24)
        }
        
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.leading.equalTo(backBtn.snp.trailing).offset(8)
            make.top.equalTo(self).inset(8)
        }
        
        addSubview(descripLbl)
        descripLbl.snp.makeConstraints { make in
            make.leading.equalTo(backBtn.snp.trailing).offset(8)
            make.top.equalTo(titleLbl.snp.bottom).offset(4)
        }
    }
}
