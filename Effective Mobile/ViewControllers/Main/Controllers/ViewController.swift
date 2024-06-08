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
    
    private let mainSearchView = MainSearchView()
    
    private let flyAwayLbl: UILabel = {
        let lbl = UILabel()
        lbl.setup(font: .installSFSemibold(fontSize: 22), color: .grey7, text: "Музыкально отлететь")
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 67
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.register(FlyAwayCollectionViewCell.self, forCellWithReuseIdentifier: FlyAwayCollectionViewCell.identifier)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    //MARK: - business objects
    private var viewModel: MainVCViewModelProtocol!
    private var coordinator: MainVCCoordinator!
    
    //MARK: - Lifecycle
    convenience init(viewModel: MainVCViewModelProtocol, coordinator: MainVCCoordinator) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.getDataFromNetwork { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addDelegates()
        addTargets()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        mainSearchView.searchView.fromTextField.text = self.viewModel.getDepartureText()
    }
    
    //MARK: - private methods
    private func addDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        mainSearchView.searchView.fromTextField.delegate = self
    }
    
    private func addTargets() {
        mainSearchView.searchView.inTextField.addTarget(self, action: #selector(searchAction), for: .allTouchEvents)
    }

    //MARK: - objc
    @objc private func searchAction() {
        coordinator.goToSearch(fromString: mainSearchView.searchView.fromTextField.text ?? "")
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
        
        view.addSubview(mainSearchView)
        mainSearchView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(titleLbl.snp.bottom).offset(38)
            make.height.equalTo(122)
        }
        
        view.addSubview(flyAwayLbl)
        flyAwayLbl.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(mainSearchView.snp.bottom).offset(32)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(flyAwayLbl.snp.bottom).offset(26)
            make.height.equalTo(213)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlyAwayCollectionViewCell.identifier, for: indexPath) as! FlyAwayCollectionViewCell
        let offer = viewModel.getDataForCell()[indexPath.row]
        
        
        cell.nameLbl.text = offer.title
        cell.cityLbl.text = offer.town
        cell.costLbl.text = "от \(offer.price.value) ₽"
        
        for model in viewModel.getImages() {
            if model.id == offer.id {
                cell.imageView.image = model.image
            }
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 132, height: 213)
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.saveDeparture(text: textField.text ?? "")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        
        let allowedCharacters = CharacterSet(charactersIn: "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ ")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
