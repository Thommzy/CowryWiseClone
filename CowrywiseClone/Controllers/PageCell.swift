//
//  PageCell.swift
//  CowrywiseClone
//
//  Created by Tim on 28/09/2020.
//

import UIKit

class PageCell : UICollectionViewCell  {

    var page : Page? {
        didSet {
            guard let page = page else { return }
            
            let imageName = page.image
            
            logo.image = UIImage(named: imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.textTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor : color])
             
            attributedText.append(NSAttributedString(string: "\n\n\(page.textBody)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            welcomeTitle.attributedText = attributedText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
   
    let logo : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: Constants.cowrywiseLogo)
        return iv
    }()
    
    let welcomeTitle : UITextView = {
        let tv = UITextView()
        tv.text = ""
        tv.textAlignment = .center
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 25.0, weight: UIFont.Weight.semibold)
        tv.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return tv
    }()
    
    let welcomeText : UITextView = {
        let tv = UITextView()
        tv.text = ""
        tv.textAlignment = .center
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.medium)
        tv.textColor = .gray
        tv.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return tv
    }()
    
    func setUpViews() {
        addSubview(logo)
        addSubview(welcomeTitle)
        addSubview(welcomeText)
        _ = logo.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -250, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
       
        logo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        _ = welcomeTitle.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 100)
        welcomeTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = welcomeText.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 100)
        welcomeText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
