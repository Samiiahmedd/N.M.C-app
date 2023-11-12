//
//  medicalCardApplicationVC.swift
//  N.M.C
//
//  Created by Sami Ahmed on 13/11/2023.
//

import UIKit

class medicalCardApplicationVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var birthDate: UITextField!
    @IBOutlet weak var nationalID: UITextField!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var personalInfoStack: UIStackView!
    @IBOutlet weak var additionalPersonalInfoStack: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        additionalPersonalInfoStack.isHidden = true
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        if let customFont = UIFont(name: "Cairo-Regular", size: 18) {
            let titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                NSAttributedString.Key.font: customFont
            ]
            segmentOutlet.setTitleTextAttributes(titleTextAttributes, for: .normal)
        }
    }
    
    // MARK: - IBActions
    @IBAction func nextButton(_ sender: Any) {
        if validateFields(){
            //            let secondScreen = MedicalCardApplicationSecondVC()
            //            self.navigationController?.pushViewController(secondScreen, animated: true)
            personalInfoStack.isHidden = true
            additionalPersonalInfoStack.isHidden = false
            imageView.isHidden = true
            
        }
        
    }
    
    @IBAction func uploadPhotoButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        
    }
    
    //MARK: - Functions
    func validateFields() -> Bool {
        if fullName.text?.isEmpty ?? true ||
            address.text?.isEmpty ?? true ||
            birthDate.text?.isEmpty ?? true ||
            nationalID.text?.isEmpty ?? true {
            displayValidationAlert(message: "Please fill all fields")
            return false
        }
        
        let nationalId = nationalID.text!
        let digitRegex = #"^\d{14}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", digitRegex)
        if !predicate.evaluate(with: nationalId) {
            displayValidationAlert(message: "National ID must be 14 numeric digits")
            return false
        }
        return true
    }
}

 //MARK: - Extentions
extension  medicalCardApplicationVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            //            print(info)
            imageView.image = image
        }
        picker.dismiss(animated: true)
    }
}
public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
}



