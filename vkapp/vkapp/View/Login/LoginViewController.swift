//
//  LoginViewController.swift
//  vkapp
//
//  Created by Pavel Lazarev on 06.09.2021.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    private lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.text = "VK App"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.placeholder = "Enter Login"
        textField.borderStyle = .roundedRect
        return textField
    }()
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.placeholder = "Enter Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViews()
        self.addGesture()
    }

    private func setViews() {
        self.setScrollView()
        self.setAppTitleLabel()
        self.setLoginLabel()
        self.setLoginTextField()
        self.setPasswordLabel()
        self.setPasswordTextField()
        self.setEnterButton()
    }
    
    private func setScrollView() {
        self.view.addSubview(scrollView)
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setAppTitleLabel() {
        self.scrollView.addSubview(self.appTitleLabel)
        self.appTitleLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 50).isActive = true
        self.appTitleLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
    }
    
    private func setLoginLabel() {
        self.scrollView.addSubview(self.loginLabel)
        self.loginLabel.topAnchor.constraint(equalTo: self.appTitleLabel.bottomAnchor, constant: 30).isActive = true
        self.loginLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
    }
    
    private func setLoginTextField() {
        self.scrollView.addSubview(self.loginTextField)
        self.loginTextField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 8).isActive = true
        self.loginTextField.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
        self.loginTextField.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
        self.loginTextField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
    }
    
    private func setPasswordLabel() {
        self.scrollView.addSubview(self.passwordLabel)
        self.passwordLabel.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 30).isActive = true
        self.passwordLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
    }
    
    private func setPasswordTextField() {
        self.scrollView.addSubview(self.passwordTextField)
        self.passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 8).isActive = true
        self.passwordTextField.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
        self.passwordTextField.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
        self.passwordTextField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
    }
    
    private func setEnterButton() {
        self.scrollView.addSubview(self.enterButton)
        self.enterButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 30).isActive = true
        self.enterButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.enterButton.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -20).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
        
        self.loginTextField.text = "account"
        self.passwordTextField.text = "123456"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
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
            
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
        
    @objc private func keyboardWillHide(notification: Notification) {
        self.scrollView.contentInset = .zero
    }
    
    private func addGesture() {
        self.scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.hideKeyboard)
            )
        )
    }
    
    @objc private func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    @objc private func enterButtonAction() {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "account" && password == "123456" {
            let mainTabBarScene = MainTabBarController()
            mainTabBarScene.modalPresentationStyle = .fullScreen
            present(mainTabBarScene, animated: true)
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

