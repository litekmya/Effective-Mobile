//
//  SampleViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class SampleViewController: UIViewController {

    private let lbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSemiboldItalic(fontSize: 36), color: .white, text: "Здесь могла быть ваша реклама))")
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        return btn
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTargets()
    }
    
    //MARK: - private methods
    private func addTargets() {
        backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
    }
    
    //MARK: - objc
    @objc private func backBtnAction() {
        dismiss(animated: true)
    }
}

//MARK: - Layout
extension SampleViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupLayoutForChildViews() {
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.leading.top.equalTo(view).inset(16)
            make.width.height.equalTo(44)
        }
        
        view.addSubview(lbl)
        lbl.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.leading.trailing.equalTo(view).inset(32)
        }
    }
}
