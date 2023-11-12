import UIKit

class GradientView: UIView {
    //gradient colors
    private let startColor = UIColor(red: 0, green: 0.69, blue: 0.922, alpha: 0.26).cgColor
    private let endColor = UIColor(red: 0.569, green: 0.522, blue: 0.745, alpha: 0.53).cgColor
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }
    
    private func setupGradient() {
        guard let gradientLayer = layer as? CAGradientLayer else {
            return
        }
        
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
}
