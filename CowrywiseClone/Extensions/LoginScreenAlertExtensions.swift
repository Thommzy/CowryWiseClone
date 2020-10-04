//
//  AlertExtension.swift
//  CowrywiseClone
//
//  Created by Tim on 03/10/2020.
//

import UIKit


extension UIViewController {
    func wrongNetworkCall(){
        let alertController = UIAlertController(title: "⚠️", message: Constants.networkErrorMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func incorrectUserDetails(){
        let alertController = UIAlertController(title: "⚠️", message: Constants.loginErrorMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func incompleteUserDetails(){
        let alertController = UIAlertController(title: "⚠️", message: Constants.IncompleteErrorMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
