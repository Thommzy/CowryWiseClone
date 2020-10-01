//
//  CheckEmailController.swift
//  CowrywiseClone
//
//  Created by Tim on 30/09/2020.
//

import UIKit

class CheckEmailController: UIViewController {
    
    lazy var topView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var lowerView : UIView = {
        let view = UIView()
        return view
    }()
    
   
    
    lazy var confirmTextTitle : UILabel = {
        let label = UILabel()
        label.text = Constants.checkEmailTitle
        label.textColor = #colorLiteral(red: 0.1457099617, green: 0.2209058106, blue: 0.3454180062, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var confirmTextsubTitle : UILabel = {
        let label = UILabel()
        label.text = Constants.checkSubTitle
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        //label.backgroundColor = .red

        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    lazy var createAccountContinueButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.checkEmailButton, for: .normal)
        button.backgroundColor = Constants.cowrywiseBlue
        button.setTitleColor(Constants.cowrywiseWhite, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleMoveToHomeScreen), for: .touchUpInside)
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.cowrywiseWhite
        view.addSubview(topView)
        
        topView.addSubview(confirmTextTitle)
        topView.addSubview(confirmTextsubTitle)
        view.addSubview(lowerView)
        lowerView.addSubview(createAccountContinueButton)
        navigationBar()
        constraints()
    }
    
    func constraints() {
        topView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        
        lowerView.anchorToTop(top: topView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        lowerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        
        
        _ = confirmTextTitle.anchor(topView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        
        _ = confirmTextsubTitle.anchor(confirmTextTitle.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 100)
        
        
        
        _ = createAccountContinueButton.anchor(confirmTextsubTitle.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 70, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
        
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
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private  func handleMoveToHomeScreen() {
        let rootVc = LoginViewController()
        let navVC = UINavigationController(rootViewController: rootVc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
