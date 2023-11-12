//
//  medicalNetworkDetailsVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 16/11/2023.
//

import UIKit

class medicalNetworkDetailsVC: UIViewController {
    
    @IBOutlet weak var medicalGroupDetailsCollectionView: UICollectionView!
    //MARK: - Variables
    var id: Int
    //MARK: - IBOutlet
    @IBOutlet weak var GradientView: GradientView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var medicalNetworkDetailsView: UIView!
    @IBOutlet weak var medicalNetworkTypeLabel: UILabel!
    @IBOutlet weak var medicalNetworkLabel: UILabel!
    @IBOutlet weak var medicalNetworkImage: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var detailedLocation: UILabel!
    @IBOutlet weak var specialization: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var disscount: UILabel!
    
    
    func  setup(categoryDetails: Details) {
        topTitle.text = categoryDetails.serviceProvider
        location.text = categoryDetails.governorate
        detailedLocation.text = categoryDetails.address
        specialization.text = categoryDetails.specialization
        number.text = categoryDetails.phoneNumber
        time.text = categoryDetails.appointments
        disscount.text = categoryDetails.discountPercentage
        medicalNetworkImage.kf.setImage(with: categoryDetails.image_url.asUrl)
    }
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //API
        APICaller.shared.medicalNetworkCategoryDetails(id: id) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.setup(categoryDetails: data.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Initilizer
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
