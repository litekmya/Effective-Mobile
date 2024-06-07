//
//  ViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 22), color: .grey7, text: "Поиск дешевых авиабилетов")
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    //MARK: - business objects
    private var viewModel: MainVCViewModelProtocol!
    
    
    //MARK: - Lifecycle
    convenience init(viewModel: MainVCViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

extension ViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupLayoutForChildViews() {
        view.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
            make.leading.trailing.equalTo(view).inset(64)
        }
    }
}
