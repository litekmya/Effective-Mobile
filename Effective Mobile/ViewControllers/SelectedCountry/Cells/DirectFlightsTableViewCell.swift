//
//  DirectFlightsTableViewCell.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class DirectFlightsTableViewCell: UITableViewCell {
    
    static let identifier = "DirectFlightsTableViewCell"
    
    let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        return view
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .white, text: "")
        return lbl
    }()
    
    let timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .white, text: "")
        return lbl
    }()
    
    let priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFRegular(fontSize: 14), color: .newBlue, text: "")
        return lbl
    }()
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.tintColor = .newBlue
        return view
    }()

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }

}

//MARK: - Layout
extension DirectFlightsTableViewCell {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        backgroundColor = .clear
    }
    
    private func setupLayoutForChildViews() {
        addSubview(circleView)
        circleView.snp.makeConstraints { make in
            make.leading.top.equalTo(self).inset(16)
            make.width.height.equalTo(24)
        }
        
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.leading.equalTo(circleView.snp.trailing).offset(8)
            make.top.equalTo(circleView)
        }
        
        addSubview(timeLbl)
        timeLbl.snp.makeConstraints { make in
            make.leading.equalTo(circleView.snp.trailing).offset(8)
            make.trailing.equalTo(self).inset(16)
            make.top.equalTo(titleLbl.snp.bottom).offset(4)
        }
        
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(14)
            make.centerY.equalTo(titleLbl)
            make.width.equalTo(10)
            make.height.equalTo(16)
        }
        
        addSubview(priceLbl)
        priceLbl.snp.makeConstraints { make in
            make.trailing.equalTo(iconImageView.snp.leading).offset(-5)
            make.centerY.equalTo(iconImageView)
        }
    }
}
