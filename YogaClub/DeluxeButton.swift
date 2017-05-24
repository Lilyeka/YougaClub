//
//  DeluxeButton.swift
//  YogaClub
//
//  Created by Лилия Левина on 16.05.17.
//  Copyright © 2017 Лилия Левина. All rights reserved.
//

import Foundation
import UIKit

final class DeluxeButton: UIControl{
    //MARK: fileprivate
    fileprivate var btnUrl: String = ""
    
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.textAlignment = .center
        label.textColor = UIColor(colorLiteralRed: 70/255, green: 70/255, blue: 70/255, alpha: 1.0)//#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        return label
    }()
    
    fileprivate let labelTop: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightHeavy)
        label.textAlignment = .center
        label.textColor = UIColor(colorLiteralRed: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)//#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //label.backgroundColor = tintColor
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.labelTop, self.label])// [self.imageView, self.label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = false
        stackView.distribution = .equalSpacing
        stackView.spacing = 1.0
        return stackView
    }()
    
    //MARK: init
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
       // self.btnUrl = ""
        initPhase2()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
         //self.btnUrl = ""
        initPhase2()
    }
    
    private func initPhase2() {
        labelTop.backgroundColor = tintColor
        layer.borderColor = tintColor.cgColor
        layer.cornerRadius = 15
        clipsToBounds = true
       
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            labelTop.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5),
            label.topAnchor.constraint(equalTo: labelTop.bottomAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            label.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor)
            ])
    }
}

extension DeluxeButton {
    
    var btnUrlName: String?{
        get{return btnUrl}
        set{btnUrl = newValue as! String}
    }
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    var textTop: String? {
        get {
            return labelTop.text
        }
        set {
            labelTop.text = newValue
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layoutMargins = UIEdgeInsets(
                top: newValue,
                left: newValue,
                bottom: newValue / 2,
                right: newValue
            )
            layer.borderWidth = newValue
        }
    }
    
    var imagePadding: CGFloat {
        get {
            return image?.alignmentRectInsets.top ?? 0
        }
        set {
            image = image?.withAlignmentRectInsets(
                UIEdgeInsets(
                    top: -newValue,
                    left: -newValue,
                    bottom: -newValue,
                    right: -newValue
                )
            )
        }
    }
    
    override func tintColorDidChange() {
        labelTop.backgroundColor = tintColor
        layer.borderColor = tintColor.cgColor
    }
}
