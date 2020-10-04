//
//  SelectUsernameController.swift
//  CowrywiseClone
//
//  Created by Tim on 29/09/2020.
//

import UIKit

class SelectUsernameController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        view.backgroundColor = .white
        view.addSubview(topView)
        topView.addSubview(usernameTextTitle)
        topView.addSubview(usernameTextsubTitle)
        view.addSubview(lowerView)
        lowerView.addSubview(usernameInputField)
        lowerView.addSubview(underLine)
        lowerView.addSubview(usernameQuestion)
        lowerView.addSubview(detailsStackView)
        lowerView.addSubview(usernameSelectContinueButton)
        selectUsernameConstraints()
    }
    
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
    
    
    
    let usernameInputField: UIStackView = {
        let usernameInputField = UIStackView()
        usernameInputField.alignment = .leading
        usernameInputField.axis = .horizontal
        usernameInputField.distribution = .fillProportionally
        usernameInputField.spacing = 0
        
        
        let userNameTextField: UILabel = {
            let textField = UILabel()
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 35 - 1, width: 0, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            textField.layer.addSublayer(bottomLine)
            textField.textColor = #colorLiteral(red: 0.4243866801, green: 0.5075187087, blue: 0.6363344193, alpha: 1)
            textField.text = "@"
            return textField
        }()
        let placeholderText: UITextField = {
            let textField = UITextField()
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 35 - 1, width: 0, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            textField.borderStyle = UITextField.BorderStyle.none
            textField.layer.addSublayer(bottomLine)
            textField.textColor = #colorLiteral(red: 0.0397489816, green: 0.1782827079, blue: 0.3944216371, alpha: 1)
            let color = #colorLiteral(red: 0.4243866801, green: 0.5075187087, blue: 0.6363344193, alpha: 1);
            let attributes = [
                
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
            ]
            textField.attributedPlaceholder = NSAttributedString(string: Constants.usernameInputPlaceholder ,
                                                                 attributes: attributes as [NSAttributedString.Key : Any])
            textField.keyboardType = .namePhonePad
            return textField
        }()
        
        usernameInputField.addArrangedSubview(userNameTextField)
        usernameInputField.addArrangedSubview(placeholderText)
        
        return usernameInputField
    }()
    
    let underLine: UILabel = {
        let titleViewText = UILabel()
        titleViewText.backgroundColor = .lightGray
        return titleViewText
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
    
    let detailsStackView: UIStackView = {
        let detailsStackView = UIStackView()
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .top
        detailsStackView.spacing = 20
        
        let firstStackView: UIStackView = {
            let firstStackView = UIStackView()
            firstStackView.alignment = .leading
            firstStackView.axis = .horizontal
            firstStackView.distribution = .fillProportionally
            firstStackView.spacing = 5
            
            let tickMark: UILabel = {
                let tick = UILabel()
                tick.text = Constants.tickedImage
                tick.textColor = #colorLiteral(red: 0.001293938141, green: 0.3973664641, blue: 0.959946692, alpha: 1)
                tick.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
                return tick
            }()
            let textField: UILabel = {
                let textField = UILabel()
                textField.text = Constants.usernameDetailOne
                textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
                textField.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
                textField.lineBreakMode = .byWordWrapping
                textField.numberOfLines = 0
                return textField
            }()
            
            firstStackView.addArrangedSubview(tickMark)
            firstStackView.addArrangedSubview(textField)
            
            return firstStackView
        }()
        
        let secondStackView: UIStackView = {
            let secondStackView = UIStackView()
            secondStackView.alignment = .leading
            secondStackView.axis = .horizontal
            secondStackView.distribution = .fillProportionally
            secondStackView.spacing = 5
            
            let tickMark: UILabel = {
                let tick = UILabel()
                tick.text = Constants.tickedImage
                tick.textColor = #colorLiteral(red: 0.001293938141, green: 0.3973664641, blue: 0.959946692, alpha: 1)
                tick.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
                return tick
            }()
            let textField: UILabel = {
                let textField = UILabel()
                textField.text = Constants.usernameDetailTwo
                textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
                textField.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
                textField.lineBreakMode = .byWordWrapping
                textField.numberOfLines = 0
                return textField
            }()
            
            secondStackView.addArrangedSubview(tickMark)
            secondStackView.addArrangedSubview(textField)
            
            return secondStackView
        }()
        detailsStackView.addArrangedSubview(firstStackView)
        detailsStackView.addArrangedSubview(secondStackView)
        
        firstStackView.anchorWithConstantsToTop(top: nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, rightConstant: 16)
        secondStackView.anchorWithConstantsToTop(top: nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, rightConstant: 16)
        
        return detailsStackView
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
    
    func selectUsernameConstraints() {
        topView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        lowerView.anchorToTop(top: topView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        lowerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        
        _ = usernameTextTitle.anchor(topView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        _ = usernameTextsubTitle.anchor(usernameTextTitle.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = usernameInputField.anchor(usernameTextsubTitle.bottomAnchor, left: lowerView.leftAnchor, bottom: nil, right: lowerView.rightAnchor, topConstant: 38, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        _ = underLine.anchor(usernameInputField.bottomAnchor, left: lowerView.leftAnchor, bottom: nil, right: lowerView.rightAnchor, topConstant: 0, leftConstant: 16, rightConstant: 16, heightConstant: 0.5)
        
        _ = usernameQuestion.anchor(usernameInputField.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        _ = detailsStackView.anchor(usernameQuestion.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        
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
