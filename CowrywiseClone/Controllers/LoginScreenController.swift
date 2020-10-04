//
//  LoginScreenController.swift
//  CowrywiseClone
//
//  Created by Tim on 03/10/2020.
//

import UIKit

class LoginScreenController: UIViewController , loginProtocol {
    
    var loginId : String?
    
    func login(loginResponse: LoginModel) {
        loginId = loginResponse.id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.cowrywiseBlue
        navigationBar()
        view.addSubview(topView)
        topView.addSubview(cancelIconButton)
        topView.addSubview(logInTitle)
        topView.addSubview(loginText)
        view.addSubview(LowerView)
        LowerView.addSubview(emailField)
        LowerView.addSubview(passwordField)
        LowerView.addSubview(signUpContinueButton)
        LowerView.addSubview(forgotPasswordStackView)
        loginScreenConstraints()
    }
    
    lazy var topView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var LowerView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var cancelIconButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0)
        let image = UIImage(named: Constants.cancelButtonWhiteImage) as UIImage?
        button.frame = CGRect(x: 8, y: 50, width: 50, height: 50)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    lazy var logInTitle : UILabel = {
        let label = UILabel()
        label.text = Constants.logInTitle
        label.textColor = Constants.cowrywiseWhite
        label.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var loginText : UILabel = {
        let label = UILabel()
        label.text = Constants.logInSubTitle
        label.textColor = Constants.cowrywiseWhite
        label.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    let emailField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.attributedPlaceholder = NSAttributedString(string: Constants.emailPlaceholder,
                                                             attributes: Constants.attributes as [NSAttributedString.Key : Any])
        textField.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.medium)
        textField.textColor = Constants.cowrywiseWhite
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 5, y: 40 - 1, width: 370, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let passwordField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.attributedPlaceholder = NSAttributedString(string: Constants.passwordAndShowPlaceholder
                                                             ,
                                                             attributes: Constants.attributes as [NSAttributedString.Key : Any])
        textField.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.medium)
        textField.textColor = Constants.cowrywiseWhite
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 5, y: 40 - 1, width: 370, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let forgotPasswordStackView: UIStackView = {
        let forgotPasswordStackView = UIStackView()
        forgotPasswordStackView.alignment = .leading
        forgotPasswordStackView.axis = .horizontal
        forgotPasswordStackView.distribution = .equalCentering
        
        let showPassword: UIButton = {
            let showPassword = UIButton(type: .system)
            showPassword.setTitle(Constants.showPasswordText, for: .normal)
            showPassword.setTitleColor(.white, for: .normal)
            showPassword.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            showPassword.addTarget(self, action: #selector(isShow), for: .touchUpInside)
            return showPassword
        }()
        
        let forgotPassword: UIButton = {
            let forgotPassword = UIButton(type: .system)
            forgotPassword.setTitle(Constants.forgotPasswordText, for: .normal)
            forgotPassword.setTitleColor(.white, for: .normal)
            forgotPassword.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            
            return forgotPassword
        }()
        
        forgotPasswordStackView.addArrangedSubview(showPassword)
        forgotPasswordStackView.addArrangedSubview(forgotPassword)
        
        return forgotPasswordStackView
    }()
    
    lazy var signUpContinueButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.loginButton, for: .normal)
        button.backgroundColor = Constants.cowrywiseWhite
        button.setTitleColor(Constants.cowrywiseDark, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
    }()
    
    func loginScreenConstraints() {
        topView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        LowerView.anchorToTop(top: topView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        LowerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        
        _ = logInTitle.anchor(topView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 40)
        
        _ = loginText.anchor(logInTitle.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = emailField.anchor(loginText.bottomAnchor, left: LowerView.leftAnchor, bottom: nil, right: LowerView.rightAnchor, topConstant: 60, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = passwordField.anchor(emailField.bottomAnchor, left: LowerView.leftAnchor, bottom: nil, right: LowerView.rightAnchor, topConstant: 60, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 20)
        
        _ = forgotPasswordStackView.anchor(passwordField.bottomAnchor, left: LowerView.leftAnchor, bottom: nil, right: LowerView.rightAnchor, topConstant: 30, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        _ = signUpContinueButton.anchor(forgotPasswordStackView.bottomAnchor, left: LowerView.leftAnchor, bottom: nil, right: LowerView.rightAnchor, topConstant: 20, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
    }
    
    func navigationBar() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
    }
    
    var willShow = false
   
    
    @objc func isShow(_ button: UIButton) {
        if willShow {
            passwordField.isSecureTextEntry = true
            button.setTitle(Constants.showPasswordText, for: .normal)
        }else {
            passwordField.isSecureTextEntry = false
            button.setTitle(Constants.hidePasswordText, for: .normal)
        }
        
        willShow = !willShow
    }
    
    @objc private  func handleLoginButton() {
        let loginLoader = LoginLoader()
        loginLoader.loginUserDelegate = self
        loginLoader.loadUserData()
        if passwordField.text != "" && emailField.text != "" {
            if (loginId != nil) {
                let rootVc = ProfileScreenController()
                let navVC = UINavigationController(rootViewController: rootVc)
                navVC.modalPresentationStyle = .fullScreen
                present(navVC, animated: true)
            }else {
                wrongNetworkCall()
            }
        }else{
            incorrectUserDetails()
        }
    }
    
    @objc private func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
