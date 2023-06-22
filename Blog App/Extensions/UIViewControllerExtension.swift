//
//  UIViewControllerExtension.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 22/06/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = "Error", message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
