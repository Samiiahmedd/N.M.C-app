//
//  supportPopUPVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 15/11/2023.
//

import UIKit

class supportPopUPVC: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var messageTextField: UITextField!
    
    init(){
        super.init(nibName: "supportPopUPVC", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        confingView()
        
    }
    
    //MARK: - IBAction
    @IBAction func backButton(_ sender: Any) {
        hide()
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        hide()
    }
    
    //MARK: - functions
    func confingView(){
        self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        self.contentView.alpha = 0
    }
    
    func appear(sender:UIViewController ){
        sender.present(self, animated: false) {
            self.show()
        }
        
    }
    
    private func show(){
        UIView.animate(withDuration: 1,delay: 0.1) {
            self.backView.alpha = 1
            self.contentView.alpha = 1
        }
        
    }
    
    func hide(){
        UIView.animate(withDuration: 1,delay: 0.1,options: .curveLinear) {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }
}
