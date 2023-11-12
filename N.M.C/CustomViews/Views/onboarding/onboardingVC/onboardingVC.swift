//
//  onboardingVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 15/11/2023.
//

import UIKit

class onboardingVC: UIViewController {
    // MARK: - Variables
    var slides: [onboardingSlide] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
        }
    }
    //MARK: -IBOtlet
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageSlide: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults().hasOnboarded = true
        navigationController?.setNavigationBarHidden(true, animated: true)
        slides = [
            .init(image: UIImage(named: "onboarding1")!, title: "مرحبا بك", descrption: "هي احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين  هي احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين  "),
            .init(image: UIImage(named: "onboarding2")!, title: "مرحبا بك", descrption: "هي احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين  هي احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين  "),
            .init(image: UIImage(named: "onboarding3")!, title: "مرحبا بك", descrption: "هي احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين  هي احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين  ")
        ]
        pageControl.numberOfPages = slides.count
        
    }
    // MARK: -IBAction
    @IBAction func nextBtn(_ sender: UIButton) {
        if currentPage < slides.count - 1 {
            currentPage += 1
            imageSlide.image = slides[currentPage].image
            discriptionLabel.text = slides[currentPage].descrption

        } else {
            let loginVC = LoginVC()
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    @IBAction func skipBtn(_ sender: UIButton) {
        let loginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}
