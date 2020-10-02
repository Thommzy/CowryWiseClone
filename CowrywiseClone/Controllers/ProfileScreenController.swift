//
//  ProfileScreenController.swift
//  CowrywiseClone
//
//  Created by Tim on 01/10/2020.
//

import UIKit


class ProfileScreenController: UIViewController, UITableViewDelegate  {
    
    var data : user?
    
    let cellId = "cellId"
    var tableViewData : [TableViewData] = [TableViewData]()
    
    
    let profileSegmentedControl : UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: Constants.ProfileSegmentedControlText)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        let attributes : [NSAttributedString.Key: Any] = [
                            .foregroundColor: UIColor.systemBlue
                        ]
        segmentedControl.setTitleTextAttributes(attributes, for: .selected)
        return segmentedControl
    }()
    
    @objc fileprivate func handleSegmentChange() {
        let tableIndex = profileSegmentedControl.selectedSegmentIndex
        switch tableIndex {
        case 0:
            rowsToDisplay = first
        case 1:
            rowsToDisplay = second
        default :
            rowsToDisplay = third
        }
        profileTableView.reloadData()
    }
    
    
    
    let profilePictureView : UIView = {
        let view = UIView()
        view.backgroundColor = Constants.cowrywiseWhite
        return view
    }()
    
    let profilePicture : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: Constants.avatar, withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        return image
    }()
    
    let profilePictureInfo : UILabel = {
          let label = UILabel()
          label.text = Constants.avatarInfo
          label.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.bold)
          label.textColor = #colorLiteral(red: 0.3980448246, green: 0.4535154104, blue: 0.5366771221, alpha: 1)
          label.textAlignment = .center
          return label
      }()
    
    
    let profileTableView = UITableView(frame: .zero , style: .plain)

    
    var first = Constants.firstViewSection
    
    
    
    
    let second = Constants.secondViewSection

    let third = Constants.threeViewSection
    
    lazy var rowsToDisplay = first
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCurrentData()
        self.loadUserDefaultData()
        let userDataLoader = UserDataLoader()
        userDataLoader.loadUserDelegate = self
        userDataLoader.loadUserData()
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        view.backgroundColor = .white
        profileTableView.register(ProfileInfoCell.self, forCellReuseIdentifier: cellId)
        backButton()
        
        
        navigationItem.title = Constants.ProfileNavigationTitle
        
        let paddedStackView = UIStackView(arrangedSubviews: [profileSegmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let profileStackView = UIStackView(arrangedSubviews: [
            profileSegmentedControl,
            profilePictureView,
            profileTableView,
            
        ])
        
        profileStackView.axis = .vertical
        
        view.addSubview(profileStackView)
        
        profilePictureView.addSubview(profilePicture)
        profilePictureView.addSubview(profilePictureInfo)
        
        
        profileStackView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 100, leftConstant: 10, bottomConstant: 0, rightConstant: 10)
        
        
        _ = profilePicture.anchor(profilePictureView.topAnchor, left: profilePictureView.leftAnchor, bottom: profilePictureView.bottomAnchor, right: profilePictureView.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        
        _ = profilePicture.anchor(profilePictureView.topAnchor, left: profilePictureView.leftAnchor, bottom: profilePictureView.bottomAnchor, right: profilePictureView.rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        
        _ = profilePictureInfo.anchor(profilePicture.bottomAnchor, left: profilePictureView.leftAnchor, bottom: profilePictureView.bottomAnchor, right: profilePictureView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    func loadUserDefaultData() {
        DispatchQueue.main.async {
            if let data = UserDefaults.standard.data(forKey: "profileData"),
               let defaultData = try? JSONDecoder().decode(user.self, from: data){
                self.data = defaultData
                self.profileTableView.reloadData()
            }
        }
    }
    
    func loadCurrentData() {
        let queue = DispatchQueue(label: "")
           queue.async {
            DispatchQueue.main.async {
               if let data =  self.data {
                self.tableViewData.append(TableViewData(leftAlignedText: "", rightAlignedText: ""))
                self.tableViewData.append(TableViewData(leftAlignedText: Constants.firstViewSection[1], rightAlignedText: data.firstName))
                self.tableViewData.append(TableViewData(leftAlignedText: Constants.firstViewSection[2], rightAlignedText: data.lastName))
                self.tableViewData.append(TableViewData(leftAlignedText: Constants.firstViewSection[3], rightAlignedText: data.username))
                self.tableViewData.append(TableViewData(leftAlignedText: Constants.firstViewSection[4], rightAlignedText: String(data.gender)))
                self.tableViewData.append(TableViewData(leftAlignedText: Constants.firstViewSection[5], rightAlignedText: String(data.dateOfBirth.prefix(10))))
                self.tableViewData.append(TableViewData(leftAlignedText: Constants.firstViewSection[6], rightAlignedText: data.nextOfKin))
                self.profileTableView.reloadData()
               }
            }
        }
    }
    
    func backButton(){
            let leftIcon = UIBarButtonItem(title: "＜Back", style: .plain, target: self, action: #selector(backToHomePage))
            navigationItem.leftBarButtonItem = leftIcon
            leftIcon.tintColor = .black
            leftIcon.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "helvetica", size: 17.0)!], for: UIControl.State.normal)
            leftIcon.setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 5.0), for: UIBarMetrics.default)
            UINavigationBar.appearance().barTintColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        }
        @objc private func backToHomePage(sender: UIBarButtonItem) {
           
            self.dismiss(animated: true, completion: nil)
        }

   
}


