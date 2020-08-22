import Foundation
import UIKit

public class InsetTextField: UITextField {
    
    @IBInspectable var topInset     : CGFloat = 0.0
    @IBInspectable var leftInset    : CGFloat = 0.0
    @IBInspectable var bottomInset  : CGFloat = 0.0
    @IBInspectable var rightInset   : CGFloat = 0.0
    
    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
        set {
            topInset    = newValue.top
            leftInset   = newValue.left
            bottomInset = newValue.bottom
            rightInset  = newValue.right
        }
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

    // text position
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
