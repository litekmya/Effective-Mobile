//
//  DirectFlightsView.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class DirectFlightsView: UIView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.register(DirectFlightsTableViewCell.self, forCellReuseIdentifier: DirectFlightsTableViewCell.identifier)
        view.backgroundColor = .clear
        return view
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 20), color: .white, text: "Прямые рельсы")
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
extension DirectFlightsView {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = UIColor(red: 29/255, green: 30/255, blue: 32/255, alpha: 1)
    }
    
    private func setupLayoutForChildViews() {
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.leading.top.equalTo(self).inset(16)
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self).inset(16)
            make.top.equalTo(titleLbl.snp.bottom).offset(8)
            make.height.equalTo(192)
        }
    }
}
