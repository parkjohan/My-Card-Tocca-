
import UIKit

class RoundedShadowImageView: UIImageView {
    override func awakeFromNib() {
        let shadowRadius: CGFloat = 12.0
        let shadowOpacity: Float = 2.0
        let shadowYOffset = 0.0
        let shadowXOffset = 0.0
        let shadowColor = UIColor.gray.cgColor
        
        layer.shadowColor = shadowColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: shadowXOffset, height: shadowYOffset)
        layer.masksToBounds = false
        clipsToBounds = false
    }
}
