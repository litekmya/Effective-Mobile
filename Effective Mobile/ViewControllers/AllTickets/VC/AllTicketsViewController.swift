//
//  AllTicketsViewController.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 06.06.2024.
//

import UIKit

class AllTicketsViewController: UIViewController {
    
    private let topView = TopTitleView()
    
    private let collectiobView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.register(AllTicketsCollectionViewCell.self, forCellWithReuseIdentifier: AllTicketsCollectionViewCell.identifier)
        return view
    }()
    
    private let buttonsView = FilterView()
    
    //MARK: - objects
    private var viewModel: AllTicketsViewModelProtocol!

    convenience init(viewModel: AllTicketsViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        viewModel.getDataFromNetwork { [weak self] in
            DispatchQueue.main.async {
                self?.collectiobView.reloadData()
            }
        }
        
        topView.titleLbl.text = viewModel.getPlaces()
        topView.descripLbl.text = viewModel.getDepartureTime() + ", 1 пассажир"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addDelegates()
        addTargets()
    }
    
    //MARK: - private methods
    private func addDelegates() {
        collectiobView.dataSource = self
        collectiobView.delegate = self
    }
    
    private func addTargets() {
        topView.backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
    }
    
    //MARK: - objc
    @objc private func backBtnAction() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Layout
extension AllTicketsViewController {
    
    private func setupUI() {
        setupView()
        setupLayoutForChildViews()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupLayoutForChildViews() {
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(56)
        }
        
        view.addSubview(collectiobView)
        collectiobView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(buttonsView)
        buttonsView.snp.makeConstraints { make in
            make.width.equalTo(203)
            make.height.equalTo(37)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension AllTicketsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllTicketsCollectionViewCell.identifier, for: indexPath) as! AllTicketsCollectionViewCell
        let ticket = viewModel.getAllTickets()[indexPath.row]
        
        if ticket.badge != nil {
            cell.comfortableView.isHidden = false
        } else {
            cell.comfortableView.isHidden = true
        }
        
        cell.pricelbl.text = String(ticket.price.value) + " ₽"
        
        let departureTime = viewModel.convertDate(dateString: ticket.departure.date)
        let arrivalTime = viewModel.convertDate(dateString: ticket.arrival.date)
        cell.departureTimeLbl.text = departureTime
        cell.arrivalTimeLbl.text = arrivalTime
        
        let travelTime = viewModel.calculateTheDifference(departureDate: ticket.departure.date, arrivalDate: ticket.arrival.date)
        
        cell.travelTimeLbl.text = travelTime + " в пути"
        
        if ticket.has_transfer {
            cell.slashLbl.isHidden = false
            cell.noTransfersLbl.isHidden = false
        } else {
            cell.slashLbl.isHidden = true
            cell.noTransfersLbl.isHidden = true
        }
        
        cell.departureAirportLbl.text = ticket.departure.airport
        cell.arrivalAirportLbl.text = ticket.arrival.airport 
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AllTicketsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 32, height: 117)
    }
}
