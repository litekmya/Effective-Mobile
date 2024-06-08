//
//  SearchViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let topLine: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.backgroundColor = .grey5
        return view
    }()
    
    private let searchView: SearchView = {
        let view = SearchView()
        view.isTwoObjects = true
        return view
    }()
    
    private let helpCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(HelpCollectionViewCell.self, forCellWithReuseIdentifier: HelpCollectionViewCell.identifier)
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        return view
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.register(RecomendationTableViewCell.self, forCellReuseIdentifier: RecomendationTableViewCell.identifier)
        view.layer.cornerRadius = 16
        view.isScrollEnabled = false
        view.clipsToBounds = true
        view.separatorColor = .grey6
        return view
    }()

    //MARK: - objects
    private var viewModel: SearchViewModelProtocol!
    private var coordinator: SearchCoordinator!
    
    //MARK: - Lifecycle
    convenience init(viewModel: SearchViewModelProtocol, coordinator: SearchCoordinator) {
        self.init()
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        searchView.fromTextField.text = viewModel.getFromString()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addDelegates()
        addTargets()
    }
    
    //MARK: - private methods
    private func addDelegates() {
        helpCollectionView.dataSource = self
        helpCollectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchView.fromTextField.delegate = self
        searchView.inTextField.delegate = self
    }
    
    private func addTargets() {
        searchView.bottomBtn.addTarget(self, action: #selector(bottomBtnAction), for: .touchUpInside)
    }
    
    //MARK: - objc
    @objc private func bottomBtnAction() {
        let fromText = searchView.fromTextField.text ?? ""
        let inText = searchView.inTextField.text ?? ""
        coordinator.goToSelectedCountry(fromText: fromText, inText: inText)
        dismiss(animated: true)
    }
}

//MARK: - Layout
extension SearchViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 41/255, alpha: 1)
    }
    
    private func setupLayoutForChildViews() {
        view.addSubview(topLine)
        topLine.snp.makeConstraints { make in
            make.top.equalTo(view).inset(16)
            make.centerX.equalTo(view)
            make.width.equalTo(38)
            make.height.equalTo(5)
        }
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(topLine.snp.bottom).offset(25)
            make.height.equalTo(96)
        }
        
        view.addSubview(helpCollectionView)
        helpCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(searchView.snp.bottom).offset(26)
            make.height.equalTo(90)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(helpCollectionView.snp.bottom).offset(26)
            make.height.equalTo(180)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNubmerOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HelpCollectionViewCell.identifier, for: indexPath) as! HelpCollectionViewCell
        let model = viewModel.getHelpData()[indexPath.row]
        
        cell.imageView.image = model.image
        cell.titleLbl.text = model.title
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = 16 * 3 // Отступы между элементами
        let availableWidth = view.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / 4 // Количество элементов в строке
        
        return CGSize(width: widthPerItem, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            searchView.inTextField.text = viewModel.getHelpData()[indexPath.row].title
        default:
            coordinator.goToExample()
        }
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecomendationTableViewCell.identifier, for: indexPath) as! RecomendationTableViewCell
        let direction = viewModel.getDirectionsData()[indexPath.row]
        
        cell.imgView.image = direction.image
        cell.titleLbl.text = direction.title
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let direction = viewModel.getDirectionsData()[indexPath.row]
        searchView.inTextField.text = direction.title
    }
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField == searchView.inTextField {
            if textField.text != "" {
                searchView.bottomBtn.isEnabled = true
            } else {
                searchView.bottomBtn.isEnabled = false
            }
        }
    }
}
