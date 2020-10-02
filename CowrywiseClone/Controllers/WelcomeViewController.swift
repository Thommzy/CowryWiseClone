//
//  WelcomeViewController.swift
//  CowrywiseClone
//
//  Created by Tim on 30/09/2020.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    
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
        let image = UIImage(named: Constants.cancelButtonBlackImage) as UIImage?
            button.frame = CGRect(x: 30, y: 50, width: 50, height: 50)
            button.setImage(image, for: .normal)
            button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
            return button
    }()
    
    lazy var cowryWiseLogo : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: Constants.cowrywiseLogo)
        return image
    }()
    
    lazy var welcomeMessage : UILabel = {
        let label = UILabel()
        label.text = Constants.welcomeMessage
        label.textColor = Constants.cowrywiseDark
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(topView)
        topView.addSubview(cancelIconButton)
        topView.addSubview(cowryWiseLogo)
        view.addSubview(LowerView)
        LowerView.addSubview(welcomeMessage)
        navigationBar()
        welcomePageConstraints()
    }
    
    
    func welcomePageConstraints() {
        topView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        LowerView.anchorToTop(top: topView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        LowerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        
        
        _ = cancelIconButton.anchor(topView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 50, leftConstant: 320, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 60)
        
        
        _ = cowryWiseLogo.anchor(cancelIconButton.bottomAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 280, widthConstant: 0, heightConstant: 60)
        
        
        _ = welcomeMessage.anchor(LowerView.topAnchor, left: topView.leftAnchor, bottom: nil, right: topView.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 300)
        }
    
    func navigationBar() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = Constants.cowrywiseWhite
    }
    
    @objc private func goBack() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
