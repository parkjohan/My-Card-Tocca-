
import UIKit

class RoundedShadowCardView: UIView {
    override func awakeFromNib() {
        let shadowRadius: CGFloat = 12.0
        let shadowOpacity: Float = 0.7
        let shadowYOffset = 0.0
        let shadowXOffset = 0.0
        let shadowColor = UIColor.gray.cgColor
        let cornerRadius: CGFloat = 20.0
        
        layer.shadowColor = shadowColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: shadowXOffset, height: shadowYOffset)
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        clipsToBounds = false
    }
}
