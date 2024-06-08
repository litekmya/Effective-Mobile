//
//  RecomendationTableViewCell.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class RecomendationTableViewCell: UITableViewCell {
    
    static let identifier = "RecomendationTableViewCell"
    
    let imgView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFMedium(fontSize: 16), color: .white, text: "text")
        return lbl
    }()
    
    let descripLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 14), color: .grey5, text: "Популярное направление")
        return lbl
    }()

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        // Configure the view for the selected state
    }

}

//MARK: - Layout
extension RecomendationTableViewCell {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        backgroundColor = .grey3
    }
    
    private func setupLayoutForChildViews() {
        addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.centerY.equalTo(self)
            make.width.height.equalTo(40)
        }
        
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.top.equalTo(imgView)
        }
        
        addSubview(descripLbl)
        descripLbl.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.bottom.equalTo(imgView)
        }
    }
}
