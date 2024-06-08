//
//  AllTicketsCollectionViewCell.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import UIKit

class AllTicketsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AllTicketsCollectionViewCell"
    
    let comfortableView: ComfortableView = {
        let view = ComfortableView()
        
        return view
    }()
    
    let pricelbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 22), color: .white, text: "")
        return lbl
    }()
    
    let departureTimeLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .white, text: "")
        return lbl
    }()
    
    let arrivalTimeLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .white, text: "")
        return lbl
    }()
    
    let travelTimeLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .white, text: "")
        return lbl
    }()
    
    let noTransfersLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .white, text: "Без пересадок")
        lbl.isHidden = true
        return lbl
    }()
    
    let departureAirportLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .grey6, text: "")
        return lbl
    }()
    
    let arrivalAirportLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .grey6, text: "")
        return lbl
    }()
    
    let slashLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .grey6, text: "/")
        return lbl
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .newRed
        return view
    }()
    
    private let dashLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .grey6, text: "-")
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
    
    //MARK: - private methods
    private func setupLayout(for view: UIView, leadingView: UIView, offset: Int) {
        view.snp.makeConstraints { make in
            make.leading.equalTo(leadingView.snp.trailing).offset(offset)
            make.centerY.equalTo(departureTimeLbl)
        }
    }
}

//MARK: - Layout
extension AllTicketsCollectionViewCell {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        backgroundColor = UIColor(red: 29/255, green: 30/255, blue: 32/255, alpha: 1)
    }
    
    private func setupLayoutForChildViews() {
        addSubview(comfortableView)
        comfortableView.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.top.equalTo(self).offset(-8)
            make.height.equalTo(21)
            make.width.equalTo(126)
        }
        
        addSubview(pricelbl)
        pricelbl.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.top.equalTo(self).inset(21)
        }
        
        addSubview(circleView)
        circleView.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.top.equalTo(pricelbl.snp.bottom).offset(23)
            make.width.height.equalTo(24)
        }
        
        addSubview(departureTimeLbl)
        departureTimeLbl.snp.makeConstraints { make in
            make.leading.equalTo(circleView.snp.trailing).offset(8)
            make.top.equalTo(self).inset(63)
            make.height.equalTo(17)
        }
        
        addSubview(dashLbl)
        setupLayout(for: dashLbl, leadingView: departureTimeLbl, offset: 2)
        
        addSubview(arrivalTimeLbl)
        setupLayout(for: arrivalTimeLbl, leadingView: dashLbl, offset: 2)
        
        addSubview(travelTimeLbl)
        setupLayout(for: travelTimeLbl, leadingView: arrivalTimeLbl, offset: 13)
        
        addSubview(slashLbl)
        setupLayout(for: slashLbl, leadingView: travelTimeLbl, offset: 2)
        
        addSubview(noTransfersLbl)
        setupLayout(for: noTransfersLbl, leadingView: slashLbl, offset: 2)
        
        addSubview(departureAirportLbl)
        departureAirportLbl.snp.makeConstraints { make in
            make.leading.equalTo(departureTimeLbl)
            make.top.equalTo(departureTimeLbl.snp.bottom).offset(4)
        }
        
        addSubview(arrivalAirportLbl)
        arrivalAirportLbl.snp.makeConstraints { make in
            make.leading.equalTo(arrivalTimeLbl)
            make.centerY.equalTo(departureAirportLbl)
        }
    }
}
