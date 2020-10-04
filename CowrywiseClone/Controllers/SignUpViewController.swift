//
//  SignUpViewController.swift
//  CowrywiseClone
//
//  Created by Tim on 28/09/2020.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBar()
        view.addSubview(signUpView)
        signUpView.addSubview(signUpTitle)
        signUpView.addSubview(signUpText)
        view.addSubview(registerFormView)
        registerFormView.addSubview(stackView)
        registerFormView.addSubview(emailField)
        registerFormView.addSubview(passwordField)
        registerFormView.addSubview(phoneField)
        registerFormView.addSubview(signUpContinueButton)
        registerFormView.addSubview(inviteLabel)
        registerFormView.addSubview(termsAndConditionLabel)
        signUpConstraints()
        passwordField.enablePasswordToggle()
    }
    
    lazy var signUpView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var registerFormView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var signUpTitle : UILabel = {
        let label = UILabel()
        label.text = Constants.signUpTitle
        label.textColor = Constants.cowrywiseDark
        label.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var signUpText : UILabel = {
        let label = UILabel()
        label.text = Constants.signUpSUbTitle
        label.textColor = Constants.cowrywiseDark
        label.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        
        let firstNameTextField: LeftPaddedTextField = {
            let textField = LeftPaddedTextField()
            textField.placeholder = Constants.firstNamePlaceholder
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 10, y: 40 - 1, width: 170, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            textField.borderStyle = UITextField.BorderStyle.none
            textField.layer.addSublayer(bottomLine)
            return textField
        }()
        
        let lastNameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = Constants.lastNamePlaceholder
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 40 - 1, width: 180, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            textField.borderStyle = UITextField.BorderStyle.none
            textField.layer.addSublayer(bottomLine)
            return textField
        }()
        
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        
        _ = firstNameTextField.anchor(nil, left: stackView.rightAnchor, bottom: nil, right: lastNameTextField.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 50)
        
        _ = lastNameTextField.anchor(nil, left: firstNameTextField.rightAnchor, bottom: nil, right: stackView.rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        return stackView
    }()
    
    let emailField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = Constants.emailPlaceholder
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 10, y: 40 - 1, width: 370, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let passwordField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = Constants.passwordPlaceholder
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 10, y: 40 - 1, width: 370, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let phoneField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = Constants.phoneNumberPlaceHolder
        textField.keyboardType = .numberPad
        textField.accessibilityValue = .none
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 10, y: 40 - 1, width: 370, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    lazy var signUpContinueButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.continueButtonText, for: .normal)
        button.backgroundColor = Constants.cowrywiseBlue
        button.setTitleColor(Constants.cowrywiseWhite, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleUsernameSelection), for: .touchUpInside)
        return button
    }()
    
    lazy var inviteLabel : UILabel = {
        let label = UILabel()
        label.text = Constants.inviteLabelText
        label.textColor = Constants.cowrywiseBlue
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var termsAndConditionLabel : UILabel = {
        var label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: Constants.termsAndConditionText1)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
                                        NSRange.init(location: 31, length: attributedString.length - 31));
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        label.textColor = Constants.cowrywiseDeepGrey
        return label
    }()
    
    func signUpConstraints() {
        signUpView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        signUpView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        registerFormView.anchorToTop(top: signUpView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        registerFormView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        
        _ = signUpTitle.anchor(signUpView.topAnchor, left: signUpView.leftAnchor, bottom: nil, right: signUpView.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 30)
        
        _ = signUpText.anchor(signUpTitle.bottomAnchor, left: signUpView.leftAnchor, bottom: nil, right: signUpView.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = stackView.anchor(registerFormView.topAnchor, left: registerFormView.leftAnchor, bottom: nil, right: registerFormView.rightAnchor, topConstant: 30, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = emailField.anchor(stackView.bottomAnchor, left: registerFormView.leftAnchor, bottom: nil, right: registerFormView.rightAnchor, topConstant: 60, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = passwordField.anchor(emailField.bottomAnchor, left: registerFormView.leftAnchor, bottom: nil, right: registerFormView.rightAnchor, topConstant: 60, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = phoneField.anchor(passwordField.bottomAnchor, left: registerFormView.leftAnchor, bottom: nil, right: registerFormView.rightAnchor, topConstant: 60, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = signUpContinueButton.anchor(phoneField.bottomAnchor, left: registerFormView.leftAnchor, bottom: nil, right: registerFormView.rightAnchor, topConstant: 100, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        _ = inviteLabel.anchor(signUpContinueButton.bottomAnchor, left: registerFormView.leftAnchor, bottom: nil, right: registerFormView.rightAnchor, topConstant: 100, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        _ = termsAndConditionLabel.anchor(inviteLabel.bottomAnchor, left: registerFormView.leftAnchor, bottom: registerFormView.bottomAnchor, right: registerFormView.rightAnchor, topConstant: 10, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
    }
    
    func navigationBar() {
        let button1 = UIBarButtonItem(image: UIImage(named: Constants.cancelButtonBlackImage), style: .plain, target: self, action: #selector(self.goBack))
        self.navigationItem.leftBarButtonItem  = button1
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1457099617, green: 0.2209058106, blue: 0.3454180062, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    @objc private func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleUsernameSelection(){
        if emailField.text == "" || emailField.text == "" || phoneField.text == ""{
            incompleteUserDetails()
        } else {
            let rootViewController =  SelectUsernameController()
            navigationController?.pushViewController(rootViewController, animated: true)
        }
    }
}
