//
//  MedicalNetworkCategoriesViewController.swift
//  N.M.C
//
//  Created by Sami Ahmed on 22/11/2023.
//

import UIKit

class MedicalNetworkCategoriesViewController: UIViewController {
    // MARK: - Variables
    var path: String
    var CategoryMedicalNewtork : [medicalgroup] = []
    
    // MARK: - IBOutlet
    @IBOutlet weak var medicalNetworkCategoriesCollectionView: UICollectionView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        medicalNetworkCategoriesCollectionView.dataSource = self
        medicalNetworkCategoriesCollectionView.delegate = self
//        let loader = self.loader()
        registerCells()
        
        //API
        APICaller.shared.getMedicalByCategory(path: path) { result in
//            self.stopLoader(loader: loader)
            switch result {
            case .success(let data):
                print(data)
                self.CategoryMedicalNewtork = data.data
                DispatchQueue.main.async {
                    self.medicalNetworkCategoriesCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func registerCells() {
        medicalNetworkCategoriesCollectionView.register(UINib(nibName: medicalGroupAllCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: medicalGroupAllCollectionViewCell.identifer)
        
        
    }
    
    // MARK: - Initilizer
    init(path: String) {
        self.path = path
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
}

// MARK: - Extentions
extension MedicalNetworkCategoriesViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: medicalGroupAllCollectionViewCell.identifer, for: indexPath) as! medicalGroupAllCollectionViewCell
        let model = CategoryMedicalNewtork[indexPath.row]
        cell.setup(title: model.serviceProvider ?? "Not found", counter: nil, imageUrl: model.image_url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryMedicalNewtork.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2) - 8 , height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = CategoryMedicalNewtork[indexPath.row].id ?? 0
        let MedicalNetworkDetails = medicalNetworkDetailsVC(id: id)
        self.navigationController?.pushViewController(MedicalNetworkDetails, animated: true)
    }
    
}
