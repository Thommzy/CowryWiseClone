//
//  ViewController.swift
//  CowrywiseClone
//
//  Created by Tim on 28/09/2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var page : Page?
    
    lazy var onBoardingCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0  
        let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Constants.cowrywiseWhite
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let fixedLoginAndSignupView : UIView = {
        let view = UIView()
        return view
    }()
    
    
    let cellId = "cellId"
    
    
    let pages : [Page] = {
        var pageArray : [Page] = []
        
        let firstPage = Page(image: Constants.imageName1, texttitle: Constants.title1, textBody: Constants.message1)
        
        let secondPage = Page(image: Constants.imageName2, texttitle: Constants.title2, textBody: Constants.message2)
        
        let thirdPage = Page(image: Constants.imageName3, texttitle: Constants.title3, textBody: Constants.message3)
        
        let fourthPage = Page(image: Constants.imageName4, texttitle: Constants.title4, textBody: Constants.message4)
        
        pageArray.append(firstPage)
        pageArray.append(secondPage)
        pageArray.append(thirdPage)
        pageArray.append(fourthPage)
        
        return pageArray
    }()
    
    
    lazy var pageControl :  UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = Constants.cowrywiseGray
        pc.currentPageIndicatorTintColor = Constants.cowrywiseBlue
        pc.numberOfPages = self.pages.count
        return pc
    }()
    
    lazy var signUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.signUpText, for: .normal)
        button.backgroundColor = Constants.cowrywiseBlue
        button.setTitleColor(Constants.cowrywiseWhite, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
       return button
    }()
    
    @objc private  func handleSignUp() {
        let rootVc = SignUpViewController()
        let navVC = UINavigationController(rootViewController: rootVc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc private  func handleLogIn() {
        let rootVc = LoginViewController()
        let navVC = UINavigationController(rootViewController: rootVc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    lazy var logInButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.loginText, for: .normal)
        button.backgroundColor = Constants.cowrywiseWhite
        button.setTitleColor(Constants.cowrywiseBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        button.layer.borderColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
       return button
    }()
    
    var pageControlBottomAnchor : NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(onBoardingCollectionView)
        view.addSubview(pageControl)
        view.addSubview(fixedLoginAndSignupView)
        
        fixedLoginAndSignupView.addSubview(signUpButton)
        fixedLoginAndSignupView.addSubview(logInButton)
        
        screenConstraints()
        onBoardingCollectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func screenConstraints() {
        _ = signUpButton.anchor(nil, left: fixedLoginAndSignupView.leftAnchor, bottom: nil, right: fixedLoginAndSignupView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
                
        _ = logInButton.anchor(signUpButton.bottomAnchor, left: fixedLoginAndSignupView.leftAnchor, bottom: nil, right: fixedLoginAndSignupView.rightAnchor, topConstant: 12, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        
        pageControlBottomAnchor = pageControl.anchor(nil, left: onBoardingCollectionView.leftAnchor, bottom: onBoardingCollectionView.safeAreaLayoutGuide.bottomAnchor, right: onBoardingCollectionView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
        
        
        onBoardingCollectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: fixedLoginAndSignupView.topAnchor, right: view.rightAnchor)
        onBoardingCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        
        fixedLoginAndSignupView.anchorToTop(top: onBoardingCollectionView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        fixedLoginAndSignupView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
       
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

