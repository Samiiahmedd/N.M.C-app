//
//  MedicalNetworkVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 12/11/2023.
//

import UIKit

class MedicalNetworkVC: UIViewController {
    
    var medicalnetwork : [medicalgroup] = []

    @IBOutlet weak var medicalNetworkCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        medicalNetworkCollectionView.dataSource = self
        medicalNetworkCollectionView.delegate = self
        registerCells()
        let loader = self.loader()
                
        //Api
        APICaller().medicalNetworkDetails { result in
            self.stopLoader(loader: loader)
            switch result {
            case .success(let data):
                self.medicalnetwork = data.data
                DispatchQueue.main.async {
                    self.medicalNetworkCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "الشبكة الطبية"
        let customFont = UIFont(name: "Cairo-Bold", size: 24)
        if let font = customFont {
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor(named: "Color 4") ?? UIColor.black
            ]
            navigationController?.navigationBar.largeTitleTextAttributes = attributes
            navigationController?.navigationBar.titleTextAttributes = attributes
        }

        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    private func registerCells() {
        medicalNetworkCollectionView.register(UINib(nibName: medicalGroupAllCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: medicalGroupAllCollectionViewCell.identifer)
    }
}

extension MedicalNetworkVC :UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return medicalnetwork.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: medicalGroupAllCollectionViewCell.identifer, for: indexPath) as! medicalGroupAllCollectionViewCell
        let model = medicalnetwork[indexPath.row]
        cell.setup(title: model.category, counter: model.MedicalNetwork, imageUrl: model.image_url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2) - 8 , height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let path = medicalnetwork[indexPath.row].category
        let MedicalNetworkCategories = MedicalNetworkCategoriesViewController(path: path)
        self.navigationController?.pushViewController(MedicalNetworkCategories, animated: true)
    }
}

