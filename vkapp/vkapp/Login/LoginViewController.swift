//
//  LoginViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 06.09.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
        
        loginTextField.text = "account"
        passwordTextField.text = "123456"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(self.keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(self.keyboardWillHide),
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
        
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView?.contentInset = .zero
    }
    
    private func addGesture() {
        self.scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)
            )
        )
    }
    
    @objc private func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    @IBAction private func enterButtonAction() {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "account" && password == "123456" {
            AppRouter().presentMainScene(from: self)
        } else if login == "admin" && password == "admin" {
            AppRouter().presentDebugScene(from: self)
        } else {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Введены неверные данные",
                preferredStyle: .alert
            )
            let cancelAction = UIAlertAction(
                title: "OK",
                style: .cancel
            )
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true)
        }
    }
    
    
}

