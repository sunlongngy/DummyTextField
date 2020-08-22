import Foundation
import UIKit

public class DummyTextField: InsetTextField {
    
    // MARK: - UI
    private let borderView: UIView = {
        let view                        = UIView()
        view.backgroundColor            = .clear
        view.layer.borderWidth          = 1
        view.layer.borderColor          = UIColor.lightGray.cgColor
        view.layer.cornerRadius         = 4
        view.clipsToBounds              = true
        view.isUserInteractionEnabled   = false
        return view
    }()
    
    private let trickView: UIView = {
        let view                = UIView()
        view.backgroundColor    = .white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label               = InsetLabel()
        label.text              = "Title"
        label.textAlignment     = .center
        label.font              = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor         = .gray
        label.backgroundColor   = .clear // .white
        label.topInset          = 0
        label.leftInset         = 6
        label.rightInset        = 6
        label.bottomInset       = 0
        return label
    }()
    
    
    // MARK: - Vairable
    private var trickViewHeight : NSLayoutConstraint!
    private var width           : CGFloat? = 1
    
    private var borderViewColor : UIColor? = UIColor.gray
    private var titleText       : String? = ""
    private var titleColor      : UIColor? = UIColor.gray
    
    public var errorMessage: String? = nil {
        didSet {
            if let errorMessage = errorMessage, errorMessage.count > 0 {
                self.borderView.layer.borderColor   = UIColor.systemPink.cgColor
                self.titleLabel.text                = errorMessage
                self.titleLabel.textColor           = .systemPink
            }
            else {
                self.borderView.layer.borderColor   = self.borderViewColor?.cgColor
                self.titleLabel.text                = self.titleText
                self.titleLabel.textColor           = self.titleColor
            }
        }
    }
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Border
        self.borderStyle    = .none
        self.font           = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        // Setup
        self.setupBorder(color: .lightGray, width: 1, radius: 4)
        self.setupTitle(text: "Title")
        
        // Inset
        self.leftInset  = 12
        self.rightInset = 12
        
        // Constraint
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Func
    public func setupBorder(color: UIColor? = .lightGray, width: CGFloat? = 1, radius: CGFloat? = 4) {
        borderView.layer.borderColor    = color?.cgColor
        borderView.layer.borderWidth    = width ?? 1
        borderView.layer.cornerRadius   = radius ?? 4
        
        self.width              = width
        self.borderViewColor    = color
        
        if trickViewHeight != nil {
            self.trickViewHeight.isActive   = false
            self.trickViewHeight.constant   = (self.width ?? 1) * 2
            self.trickViewHeight.isActive   = true
        }
    }
    
    public func setupTitle(text: String, textColor: UIColor? = .gray, font: UIFont? = UIFont.systemFont(ofSize: 12, weight: .regular)) {
        titleLabel.text         = text
        titleLabel.textColor    = textColor
        titleLabel.font         = font
        
        self.titleText  = text
        self.titleColor = textColor
    }
    
    private func setupConstraint() {
        addSubview(borderView)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        addSubview(trickView)
        addSubview(titleLabel)
        
        trickView.translatesAutoresizingMaskIntoConstraints = false
        self.trickViewHeight = trickView.heightAnchor.constraint(equalToConstant: (width ?? 1) * 2)
        NSLayoutConstraint.activate([
            trickView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            trickView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            trickView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            trickViewHeight,
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -14),
        ])
    }
}
