//
//  SearchView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class SearchView: UIView {
    
    var isTwoObjects: Bool! {
        didSet {
            setupUI()
            
            if isTwoObjects {
                centerImageView.isHidden = true
            } else {
                topImageView.isHidden = true
                bottomBtn.isHidden = true
            }
        }
    }
    
    let topImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "air")
        return view
    }()
    
    let centerImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "magnifyingglass")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let bottomBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "whiteMagnifyingglass"), for: .normal)
        btn.isEnabled = false
        return btn
    }()
    
    let fromTextField: UITextField = {
        let field = UITextField()
        field.setup(color: .white, placeholder: "Откуда - Москва")
        return field
    }()
    
    let swapBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.contentMode = .scaleAspectFit
        btn.isHidden = true
        return btn
    }()
    
    let inTextField: UITextField = {
        let field = UITextField()
        field.setup(color: .white, placeholder: "Куда - Турция")
        return field
    }()
    
    let clearBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "clear"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        return btn
    }()
    
    private let separView: UIView = {
        let view = UIView()
        view.backgroundColor = .grey4
        view.alpha = 0.62
        
        return view
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - objc
    @objc private func clearTextField() {
        inTextField.text = ""
    }
}

//MARK: - Layout
extension SearchView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = .grey2
        makeShadow()
    }
    
    private func setupLayoutForChildViews() {
        addSubview(topImageView)
        topImageView.snp.makeConstraints { make in
            make.leading.top.equalTo(self).inset(16)
            make.width.height.equalTo(20)
        }
        
        addSubview(fromTextField)
        fromTextField.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(48)
            make.centerY.equalTo(topImageView)
            make.trailing.equalTo(self).inset(16)
            make.height.equalTo(21)
        }
        fromTextField.rightView = swapBtn
        fromTextField.rightViewMode = .whileEditing
        
        addSubview(centerImageView)
        centerImageView.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.centerY.equalTo(self)
            make.width.height.equalTo(24)
        }
        
        addSubview(separView)
        separView.snp.makeConstraints { make in
            if isTwoObjects {
                make.leading.equalTo(self).inset(16)
            } else {
                make.leading.equalTo(centerImageView.snp.trailing).offset(16)
            }
            make.trailing.equalTo(self).inset(16)
            make.top.equalTo(topImageView.snp.bottom).offset(8)
            make.height.equalTo(1)
        }
        
        addSubview(bottomBtn)
        bottomBtn.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.top.equalTo(separView.snp.bottom).offset(8)
            make.width.height.equalTo(24)
        }
        
        addSubview(inTextField)
        inTextField.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(48)
            make.centerY.equalTo(bottomBtn)
            make.trailing.equalTo(self).inset(16)
            make.height.equalTo(21)
        }
        inTextField.rightView = clearBtn
        inTextField.rightViewMode = .whileEditing
    }
}
