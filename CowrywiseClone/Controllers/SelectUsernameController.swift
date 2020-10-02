//
//  SelectUsernameController.swift
//  CowrywiseClone
//
//  Created by Tim on 29/09/2020.
//

import UIKit

class SelectUsernameController : UIViewController {
    var cowrywiseBlue = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
    var cowrywiseWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var cowrywiseGray = #colorLiteral(red: 0.948867619, green: 0.9487841725, blue: 0.9652295709, alpha: 1)
    
    lazy var topView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var lowerView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var usernameTextTitle : UILabel = {
        let label = UILabel()
        label.text = Constants.usernameTitle
        label.textColor = #colorLiteral(red: 0.1457099617, green: 0.2209058106, blue: 0.3454180062, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var usernameTextsubTitle : UILabel = {
        let label = UILabel()
        label.text = Constants.usernameSubTitle
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0

        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    let usernameField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = Constants.fixedMentionPlaceholder
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 10, y: 55 - 1, width: 350, height: 0.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    lazy var usernameQuestion : UILabel = {
        let label = UILabel()
        label.text = Constants.usernameQuestionText
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2992200553, green: 0.6313085556, blue: 0.9966560006, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    lazy var accountDetailsOne : UILabel = {
        let label = UILabel()
        let fullString = NSMutableAttributedString(string: " ")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: Constants.tickedImage)
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: Constants.usernameDetailOne))
        label.attributedText = fullString
        
        label.textColor = #colorLiteral(red: 0.1960784314, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    
    lazy var accountDetailsTwo : UILabel = {
        let label = UILabel()
        let fullString = NSMutableAttributedString(string: " ")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: Constants.tickedImage)
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: Constants.usernameDetailTwo))
        let style = NSMutableParagraphStyle()
                style.alignment = .left
                style.headIndent = 60
        label.attributedText = fullString
        label.textAlignment = NSTextAlignment.justified
       // label.alignmentRectInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        label.textColor = #colorLiteral(red: 0.1960784314, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    lazy var usernameSelectContinueButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.continueButtonText, for: .normal)
        button.backgroundColor = cowrywiseBlue
        button.setTitleColor(cowrywiseWhite, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleMoveToScreen), for: .touchUpInside)
       return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        view.backgroundColor = .white
        view.addSubview(topView)
        topView.addSubview(usernameTextTitle)
        topView.addSubview(usernameTextsubTitle)
        view.addSubview(lowerView)
        lowerView.addSubview(usernameField)
        lowerView.addSubview(usernameQuestion)
        lowerView.addSubview(accountDetailsOne)
        lowerView.addSubview(accountDetailsTwo)
        lowerView.addSubview(usernameSelectContinueButton)
        
       
        constraints()
    }
    
    func constraints() {
        topView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        
        lowerView.anchorToTop(top: topView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        lowerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        
        
        _ = usernameTextTitle.anchor(topView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        
        _ = usernameTextsubTitle.anchor(usernameTextTitle.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = usernameField.anchor(lowerView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = usernameQuestion.anchor(usernameField.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = accountDetailsOne.anchor(usernameQuestion.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = accountDetailsTwo.anchor(accountDetailsOne.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = usernameSelectContinueButton.anchor(nil, left: topView.leftAnchor, bottom: lowerView.bottomAnchor, right: topView.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 70, rightConstant: 20, widthConstant: 0, heightConstant: 50)
    }
    
    func navigationBar() {
        let button1 = UIBarButtonItem(image: UIImage(named: Constants.backIcon), style: .plain, target: self, action: #selector(self.goBack))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1457099617, green: 0.2209058106, blue: 0.3454180062, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    @objc private func goBack(sender: UIBarButtonItem) {
            _ = navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleMoveToScreen(){
        let rootVc =  ConfirmEmailController()
        navigationController?.pushViewController(rootVc, animated: true)
    }
}
