//
//  SelectedCountryViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class SelectedCountryViewController: UIViewController {
    
    private let searchView: SearchView = {
        let view = SearchView()
        view.isTwoObjects = false
        view.centerImageView.image = UIImage(systemName: "arrow.left")
        view.tintColor = .white
        view.swapBtn.isHidden = false
        view.swapBtn.addTarget(self, action: #selector(swapText), for: .touchUpInside)

        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.register(SelectedCountryCollectionViewCell.self, forCellWithReuseIdentifier: SelectedCountryCollectionViewCell.identifier)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let directFlightsView = DirectFlightsView()
    
    private let showBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 8
        btn.backgroundColor = .newBlue
        btn.setTitle("Посмотреть все билеты", for: .normal)
        btn.titleLabel?.font = .installSFRegular(fontSize: 16)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private let subscribView = SubscribView()
    
    //MARK: - objects
    private var viewModel: SelectedCountryVierwModelProtocol!
    private var coordinator: SelectedCountryCoordinator!
    
    private var fromText = ""
    private var inText = ""
    private var date = ""
        
    //MARK: - Lifecycle
    convenience init(viewModel: SelectedCountryVierwModelProtocol!, coordinator: SelectedCountryCoordinator!) {
        self.init()
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        searchView.fromTextField.text = viewModel.getDataForFields().0
        searchView.inTextField.text = viewModel.getDataForFields().1
        
        fromText = viewModel.getDataForFields().0
        inText = viewModel.getDataForFields().1
        
        viewModel.getDataFromNetwork { [weak self] in
            self?.directFlightsView.tableView.reloadData()
        }
        
        date = viewModel.getCurrentStringDate(date: Date())
        
        checkFillData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addDelegates()
        addTargets()
    }
    
    //MARK: - private methods
    private func addDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        directFlightsView.tableView.dataSource = self
        directFlightsView.tableView.delegate = self
        
        searchView.fromTextField.delegate = self
        searchView.inTextField.delegate = self
    }
    
    private func addTargets() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureAction))
        searchView.centerImageView.addGestureRecognizer(gesture)
        
        showBtn.addTarget(self, action: #selector(showBtnAction), for: .touchUpInside)
    }
    
    private func openCalendar(index: Int) {
        let alert = UIAlertController(title: "Выберите дату", message: "\n\n", preferredStyle: .alert)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.locale = Locale(identifier: "ru_RU")
        
        alert.view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints { make in
            make.center.equalTo(alert.view)
            make.height.equalTo(150)
        }
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { [weak self] _ in
            let selectedDate = datePicker.date
            self?.date = self?.viewModel.getCurrentStringDate(date: selectedDate) ?? ""
            self?.viewModel.getChoosenDate(date: selectedDate, index: index) {
                self?.collectionView.reloadData()
            }
        }))
        
        present(alert, animated: true)
    }
    
    private func color(from colorString: String) -> UIColor {
        switch colorString {
        case "newRed":
            return UIColor.red
        case "newBlue":
            return UIColor.blue
        case "white":
            return UIColor.white
        default:
            return UIColor.clear
        }
    }
    
    private func checkFillData() {
        if fromText != "",
           inText != "" {
            showBtn.isEnabled = true
            showBtn.alpha = 1
        } else {
            showBtn.isEnabled = false
            showBtn.alpha = 0.5
        }
    }
        
    //MARK: - objc
    @objc private func gestureAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func showBtnAction() {
        coordinator.goToAllTickets(departureTime: date, departurePlace: fromText, arrivalPlace: inText)
    }
    
    @objc private func swapText() {
        inText = searchView.fromTextField.text ?? ""
        searchView.fromTextField.text = searchView.inTextField.text
        searchView.inTextField.text = inText
    }
}

//MARK: - Layout
extension SelectedCountryViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupLayoutForChildViews() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(96)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(searchView.snp.bottom).offset(15)
            make.height.equalTo(33)
        }
        
        view.addSubview(directFlightsView)
        directFlightsView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.height.equalTo(240)
        }
        
        view.addSubview(showBtn)
        showBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(directFlightsView.snp.bottom).offset(18)
            make.height.equalTo(42)
        }
        
        view.addSubview(subscribView)
        subscribView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(showBtn.snp.bottom).offset(24)
            make.height.equalTo(51)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SelectedCountryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedCountryCollectionViewCell.identifier, for: indexPath) as! SelectedCountryCollectionViewCell
        let filter = viewModel.getFilters()[indexPath.row]
        
        if filter.image != nil {
            cell.imageView.image = filter.image
        } else {
            cell.imageView.snp.updateConstraints { make in
                make.width.equalTo(0)
            }
        }
        
        cell.titleLbl.text = filter.title
        
        if filter.day != "" {
            cell.daylbl.text = ", \(filter.day)"
        } else {
            cell.daylbl.text = ""
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SelectedCountryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let filter = viewModel.getFilters()[indexPath.row]
        let font = UIFont.installSFRegular(fontSize: 14)
        let titleString = filter.title as NSString
        let dayString = filter.day as NSString
        
        let titleWidth = titleString.boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        ).size.width
        
        let dayWidth = dayString.boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        ).size.width
        
        let width = titleWidth + 46 + dayWidth
        
        return CGSize(width: width, height: 33)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            openCalendar(index: 0)
        case 1:
            openCalendar(index: 1)
        default:
            break
        }
    }
}

//MARK: - UITableViewDataSource
extension SelectedCountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DirectFlightsTableViewCell.identifier, for: indexPath) as! DirectFlightsTableViewCell
        let ticket = viewModel.getDataForCell()[indexPath.row]
        let colors = viewModel.getColorNames().map { colorString -> UIColor in
            return self.color(from: colorString)
        }
        cell.titleLbl.text = ticket.title
        
        var times = ""
        for time in ticket.time_range {
            times.append(" \(time)")
        }
        
        cell.circleView.backgroundColor = colors[indexPath.row]
        cell.timeLbl.text = times
        cell.priceLbl.text = "\(ticket.price.value) ₽"
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SelectedCountryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        68
    }
}

//MARK: - UITextFieldDelegate
extension SelectedCountryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == searchView.fromTextField {
            fromText = textField.text ?? ""
        }
        
        if textField == searchView.inTextField {
            inText = textField.text ?? ""
        }
        
        checkFillData()
    }
}
