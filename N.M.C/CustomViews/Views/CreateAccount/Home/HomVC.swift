//
//  HomVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 08/11/2023.
//

import UIKit

class HomVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var MedicalGroupCollectionView: UICollectionView!
    @IBOutlet weak var latestContractsCollectionView: UICollectionView!
    @IBOutlet weak var medicalUpgradeCollectionView: UICollectionView!
    
    //MARK: - Variables
    var Banners : [slide] = []
    var MedicalGroups : [Category] = []
    var latestContracts : [image] = []
    var medicalUpgrades : [Category] = []
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        MedicalGroupCollectionView.dataSource = self
        MedicalGroupCollectionView.delegate = self
        latestContractsCollectionView.dataSource = self
        latestContractsCollectionView.delegate = self
        medicalUpgradeCollectionView.dataSource = self
        medicalUpgradeCollectionView.delegate = self
        registerCells()
        let loader = self.loader()
        

        
        
        //SliderAPI
        APICaller().getSliderApi { result in
            self.stopLoader(loader: loader)
            switch result {
            case .success(let data):
                self.Banners = data.data
                DispatchQueue.main.async {
                    self.bannerCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //MedicalGroupAPI
        APICaller().getMedicalGroupApi { result in
            self.stopLoader(loader: loader)
            switch result {
            case .success(let data):
                self.MedicalGroups = data.data
                DispatchQueue.main.async {
                    self.MedicalGroupCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //getMedicalUpgradeAPI
        APICaller().getMedicalUpgradeAPI { result in
            self.stopLoader(loader: loader)
            switch result {
            case .success(let data):
                self.medicalUpgrades = data.data
                DispatchQueue.main.async {
                    self.medicalUpgradeCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //latestEnagements
        APICaller().getlatestEnagementsApi { result in
            self.stopLoader(loader: loader)
            switch result {
            case .success(let data):
                self.latestContracts = data.data
                DispatchQueue.main.async {
                    self.latestContractsCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - functions
    private func registerCells() {
        bannerCollectionView.register(UINib(nibName: BannerCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: BannerCollectionViewCell.identifer)
        MedicalGroupCollectionView.register(UINib(nibName: MedicalGroupCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: MedicalGroupCollectionViewCell.identifer)
        latestContractsCollectionView.register(UINib(nibName: latestContractsCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: latestContractsCollectionViewCell.identifer)
        medicalUpgradeCollectionView.register(UINib(nibName: MedicalGroupCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: MedicalGroupCollectionViewCell.identifer)
    }
}

extension HomVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case bannerCollectionView:
            return Banners.count
        case MedicalGroupCollectionView:
            return MedicalGroups.count
        case latestContractsCollectionView:
            return latestContracts.count
        case medicalUpgradeCollectionView:
            return medicalUpgrades.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        case bannerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifer, for: indexPath) as! BannerCollectionViewCell
            cell.setup(Banner: Banners[indexPath.row])
            return cell
            
        case MedicalGroupCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MedicalGroupCollectionViewCell.identifer, for: indexPath) as! MedicalGroupCollectionViewCell
            cell.setup(MedicalGroup: MedicalGroups[indexPath.row])
            return cell
            
        case latestContractsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: latestContractsCollectionViewCell.identifer, for: indexPath) as! latestContractsCollectionViewCell
            cell.setup(latestContracts: latestContracts[indexPath.row])
            return cell
            
        case medicalUpgradeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MedicalGroupCollectionViewCell.identifer, for: indexPath) as! MedicalGroupCollectionViewCell
            cell.setup(MedicalGroup: medicalUpgrades[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case bannerCollectionView:
            
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        case MedicalGroupCollectionView:
            return CGSize(width: 104, height: 100)
        case latestContractsCollectionView:
            return CGSize(width: 100, height: 100)
        case medicalUpgradeCollectionView:
            return CGSize(width: 104, height: 100)
        default:
            return CGSize(width: 100, height: 100)
        }
        
    }
    
}
